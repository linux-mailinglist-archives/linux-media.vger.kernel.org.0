Return-Path: <linux-media+bounces-19840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4929A355A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 08:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122461F21902
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B179185B67;
	Fri, 18 Oct 2024 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYnc07ik"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7061836D9;
	Fri, 18 Oct 2024 06:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232819; cv=none; b=SI3MSrGIcIg2HOSyWjmL50EQMS3tlu1j1cSL39FNAcW7EZi6NKr3hV5ll0THzGrMeUxkXlQUEdJKnrCf7bBscPMLVhsVpeLly/d8G8ItmKwTRdeQcC0XoB9cFm+Teoet7VHIV2CuWya3OxSvdhoZVR5veMY8kBjnMDY3e1pjxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232819; c=relaxed/simple;
	bh=9EWLU1BvcV1yCbIR/VE/eDoNeKRVmiM7oD9zHyZiPnM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNGN9M3zx0JpTE6VTym9HgE3fZZYhFjDW4XMh7QbK3Z2Rl17aN5/KM7yK/3PMUW0wnZqh1+AoBh4RYVz+35bTL/UAh/8jIXqIoTe4ajDrrMFba72+NJglaYfaoXUwt0HL8wdZqhguYyytEdJjnt95qXXdvVKYQJVy2A59swLt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYnc07ik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF129C4CEC3;
	Fri, 18 Oct 2024 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729232819;
	bh=9EWLU1BvcV1yCbIR/VE/eDoNeKRVmiM7oD9zHyZiPnM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bYnc07ikkrGq+33D9jAYIchL9T/phAX0SF7MH/rcmjClGwpgMADk+y52Mgd9kBzyM
	 xdINljmuARXQHU/82eJD9oeINkOyk+JPp/18DVM75m3FLQuEpVBCOhXSimNK7lpCKg
	 c0zNbRSsDld7427MHi7eAKHSQyItjq5+EndruOfUXtXKmBUpKUDWmXiI062HoAkzl9
	 062c6cFMIcVFNr9ZFStXSqBo6xtERhWtL58lptZnYg1nPJJd449RXPyunTU+zex/Ab
	 ezVYKFlinHrI+tcHX/4L+V7XcuDiyM1DiXFCOzJiV9x8wWV/M4CBlMq0Xz1M67c8YO
	 eG8NxtJs78P/A==
Date: Fri, 18 Oct 2024 08:26:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for
 v4l2_g_ctrl()
Message-ID: <20241018082654.04cae950@foz.lan>
In-Reply-To: <2caf0dfc-6d7c-4561-b126-4f3c654706fe@xs4all.nl>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
	<4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>
	<2caf0dfc-6d7c-4561-b126-4f3c654706fe@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 18 Oct 2024 08:13:01 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 18/10/2024 07:53, Mauro Carvalho Chehab wrote:
> > As detected by Coverity, the error check logic at get_ctrl() is
> > broken: if ptr_to_user() fails to fill a control due to an error,
> > no errors are returned and v4l2_g_ctrl() returns success on a
> > failed operation, which may cause applications to fail.
> > 
> > Add an error check at get_ctrl() and ensure that it will
> > be returned to userspace without filling the control value if
> > get_ctrl() fails.
> > 
> > Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > index e5a364efd5e6..a0de7eeaf085 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > @@ -753,9 +753,10 @@ static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control *c)
> >  		for (i = 0; i < master->ncontrols; i++)
> >  			cur_to_new(master->cluster[i]);
> >  		ret = call_op(master, g_volatile_ctrl);
> > -		new_to_user(c, ctrl);
> > +		if (!ret)
> > +			ret = new_to_user(c, ctrl);
> >  	} else {
> > -		cur_to_user(c, ctrl);
> > +		ret = cur_to_user(c, ctrl);
> >  	}
> >  	v4l2_ctrl_unlock(master);
> >  	return ret;
> > @@ -770,7 +771,10 @@ int v4l2_g_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_control *control)
> >  	if (!ctrl || !ctrl->is_int)
> >  		return -EINVAL;
> >  	ret = get_ctrl(ctrl, &c);
> > -	control->value = c.value;
> > +
> > +	if (!ret)
> > +		control->value = c.value;
> > +
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(v4l2_g_ctrl);
> > @@ -811,10 +815,12 @@ static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
> >  	int ret;
> >  
> >  	v4l2_ctrl_lock(ctrl);
> > -	user_to_new(c, ctrl);
> > +	ret = user_to_new(c, ctrl);
> > +	if (ret)
> > +		return ret;
> 
> A lock was taken above and that isn't unlocked here.
> 
> It is better to write this as:
> 
> 	if (!ret)
> 		ret = set_ctrl(fh, ctrl, 0);
> 
> >  	ret = set_ctrl(fh, ctrl, 0);
> >  	if (!ret)
> > -		cur_to_user(c, ctrl);
> > +		ret = cur_to_user(c, ctrl);
> >  	v4l2_ctrl_unlock(ctrl);
> >  	return ret;
> >  }

True. See below.

Thanks,
Mauro

-

[PATCH v3] media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()

As detected by Coverity, the error check logic at get_ctrl() is
broken: if ptr_to_user() fails to fill a control due to an error,
no errors are returned and v4l2_g_ctrl() returns success on a
failed operation, which may cause applications to fail.

Add an error check at get_ctrl() and ensure that it will
be returned to userspace without filling the control value if
get_ctrl() fails.

Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..95a2202879d8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -753,9 +753,10 @@ static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control *c)
 		for (i = 0; i < master->ncontrols; i++)
 			cur_to_new(master->cluster[i]);
 		ret = call_op(master, g_volatile_ctrl);
-		new_to_user(c, ctrl);
+		if (!ret)
+			ret = new_to_user(c, ctrl);
 	} else {
-		cur_to_user(c, ctrl);
+		ret = cur_to_user(c, ctrl);
 	}
 	v4l2_ctrl_unlock(master);
 	return ret;
@@ -770,7 +771,10 @@ int v4l2_g_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_control *control)
 	if (!ctrl || !ctrl->is_int)
 		return -EINVAL;
 	ret = get_ctrl(ctrl, &c);
-	control->value = c.value;
+
+	if (!ret)
+		control->value = c.value;
+
 	return ret;
 }
 EXPORT_SYMBOL(v4l2_g_ctrl);
@@ -811,10 +815,11 @@ static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
 	int ret;
 
 	v4l2_ctrl_lock(ctrl);
-	user_to_new(c, ctrl);
-	ret = set_ctrl(fh, ctrl, 0);
+	ret = user_to_new(c, ctrl);
+	if (!ret)
+		ret = set_ctrl(fh, ctrl, 0);
 	if (!ret)
-		cur_to_user(c, ctrl);
+		ret = cur_to_user(c, ctrl);
 	v4l2_ctrl_unlock(ctrl);
 	return ret;
 }
-- 
2.47.0




