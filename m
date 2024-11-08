Return-Path: <linux-media+bounces-21157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209C9C1DF1
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B57BB2290B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CFF1EB9F0;
	Fri,  8 Nov 2024 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uT8Sy4XL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D227A1E2857
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072510; cv=none; b=qrzs4A/CA9IWHyNEH6sVTPYTMHC0WI/X6wjfHE/BffKIWLN1agiyddRxO8kb/sTM0oKoOfsxa+28MymkUEGs3a0sF2/D/1+O1m6KOCQDhF9ewopQ04VznJ4L9pXss7B+1yJGvMEwaRb+c5iFDgqRb89X5fqz8HKIV78AI09JtpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072510; c=relaxed/simple;
	bh=rycJ9tlfu9aCMcdrZFc26g3ZBgvvpIo8lEgFxhoCU0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQiSEG8QQgBEVC3/hYXBn4GT2PZVbFxHrsLvrP+n1F5eoO0vN7M+Vb0jf9KbhJ4CXwea/8frparbS5ZVptt64DfcetXMIVqZHjcnw2TY3rRnwObk7hVL/0zVgejEzebMthhwVlir6e/EXLxN1mY/5Dxcq/lJeI8IO7eUd4yi+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uT8Sy4XL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B126C2C5;
	Fri,  8 Nov 2024 14:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731072497;
	bh=rycJ9tlfu9aCMcdrZFc26g3ZBgvvpIo8lEgFxhoCU0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uT8Sy4XLE0P90QJj2gTfSmHmKZVheeXXOW2P1QrW5xL5cKu4WYwkxIuaoPy/miAIr
	 MiU/baKdt/9/Xe3Ve5Nd4DovFRyS58X6u48pn8u2t6EcMfk3Px6wERE5g9lToqN3JN
	 TBAGPJ9xj4hHjCBdrwMGJaxe7w3O9AiELKxC+vY0=
Date: Fri, 8 Nov 2024 15:28:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCHv2] media: v4l2-core: v4l2-ctrls: check for
 handler_new_ref misuse
Message-ID: <20241108132820.GB31396@pendragon.ideasonboard.com>
References: <ddb6e006-7440-41c5-8aaa-685b058418b4@xs4all.nl>
 <Zy3ktRUxfYoylLvB@valkosipuli.retiisi.eu>
 <ee6bcb24-2808-4025-91f2-2da945ce9d9c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee6bcb24-2808-4025-91f2-2da945ce9d9c@xs4all.nl>

Hello,

On Fri, Nov 08, 2024 at 11:49:01AM +0100, Hans Verkuil wrote:
> On 08/11/2024 11:15, Sakari Ailus wrote:
> > On Tue, Nov 05, 2024 at 08:42:04AM +0100, Hans Verkuil wrote:
> >> An out-of-tree driver created a control handler, added controls, then
> >> called v4l2_ctrl_add_handler to add references to controls from another
> >> handler, and finally added another control that happened to have the same
> >> control ID as one of the controls from that other handler.

Naughty driver :-)

> >>
> >> This caused a NULL pointer crash when an attempt was made to use that last
> >> control.
> >>
> >> Besides the fact that two out-of-tree drivers used the same control ID for
> >> different (private) controls, which is obviously a bug, this specific
> >> scenario should have been caught. The root cause is the 'duplicate ID'
> >> check in handler_new_ref(): it expects that drivers will first add all
> >> controls to a control handler before calling v4l2_ctrl_add_handler. That
> >> way the local controls will always override references to controls from
> >> another handler.
> > 
> > Do we support adding new controls after adding the handler or is there a
> > valid use case for it? I'd rather say it's not supported and prevent it,
> > for simplicity. Things like this will likely make it more difficult to move
> > the controls to the device state.
> 
> Blocking this completely is out of scope of this patch. I am not quite sure
> if doing that wouldn't break some drivers (in or out of tree).
> 
> If this turns out to be an issue when moving controls to the device state,
> then we can revisit this.

I tend to agree with Sakari here. I believe the control framework is
already complex enough, and I don't think we should allow drivers to add
cnotrols after calling v4l2_ctrl_add_handler(). If there are any in-tree
drivers doing so, we can probably fix them fairly easily.

As for generating a warning instead of crashing when the control is
accessed, we could generate a warning if a control is added by the
driver after calling v4l2_ctrl_add_handler(). That could even cause the
control handler to flag an error, and that would be very visible to
driver authors.

> > Cc Laurent and Jacopo.
> > 
> >> It never considered the case where new local controls were added after
> >> calling v4l2_ctrl_add_handler. Add a check to handler_new_ref() to return
> >> an error in the case that a new local control is added with the same ID as
> >> an existing control reference. Also use WARN_ON since this is a driver bug.
> >>
> >> This situation can only happen when out-of-tree drivers are used or during
> >> driver development, since mainlined drivers all have their own control
> >> ranges reserved in v4l2-controls.h, thus preventing duplicate control IDs.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >> ---
> >> Changes since v1:
> >> Improved the comment.
> >> ---
> >>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 34 +++++++++++++++++++----
> >>  1 file changed, 28 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >> index eeab6a5eb7ba..8fac12e78481 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >> @@ -1676,6 +1676,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
> >>  	u32 class_ctrl = V4L2_CTRL_ID2WHICH(id) | 1;
> >>  	int bucket = id % hdl->nr_of_buckets;	/* which bucket to use */
> >>  	unsigned int size_extra_req = 0;
> >> +	int ret = 0;
> >>
> >>  	if (ctrl_ref)
> >>  		*ctrl_ref = NULL;
> >> @@ -1719,13 +1720,32 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
> >>  	list_for_each_entry(ref, &hdl->ctrl_refs, node) {
> >>  		if (ref->ctrl->id < id)
> >>  			continue;
> >> -		/* Don't add duplicates */
> >> -		if (ref->ctrl->id == id) {
> >> -			kfree(new_ref);
> >> -			goto unlock;
> >> +		/* Check we're not adding a duplicate */
> >> +		if (ref->ctrl->id != id) {
> >> +			list_add(&new_ref->node, ref->node.prev);
> >> +			break;
> >>  		}
> >> -		list_add(&new_ref->node, ref->node.prev);
> >> -		break;
> >> +
> >> +		/*
> >> +		 * If we add a new control to this control handler, and we find
> >> +		 * that it is a duplicate, then that is a driver bug. Warn and
> >> +		 * return an error.
> >> +		 *
> >> +		 * It can be caused by either adding the same control twice, or
> >> +		 * by first calling v4l2_ctrl_add_handler, and then adding a new
> >> +		 * control to this control handler.
> >> +		 *
> >> +		 * Either sequence is incorrect.
> >> +		 *
> >> +		 * However, if the control is owned by another handler, and
> >> +		 * a control with that ID already exists in the list, then we
> >> +		 * can safely skip it: in that case it the control is overridden
> >> +		 * by the existing control.
> >> +		 */
> >> +		if (WARN_ON(hdl == ctrl->handler))
> >> +			ret = -EEXIST;
> >> +		kfree(new_ref);
> >> +		goto unlock;
> >>  	}
> >>
> >>  insert_in_hash:
> >> @@ -1746,6 +1766,8 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
> >>
> >>  unlock:
> >>  	mutex_unlock(hdl->lock);
> >> +	if (ret)
> >> +		return handler_set_err(hdl, ret);
> >>  	return 0;
> >>  }
> >>

-- 
Regards,

Laurent Pinchart

