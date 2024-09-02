Return-Path: <linux-media+bounces-17418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21526969053
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 01:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CADC5284A65
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43B0187571;
	Mon,  2 Sep 2024 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ES5A2FqE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB072185B5E
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 23:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725318481; cv=none; b=i9lmMkcr7t+gkivxPmNULavbyrb2De6rOF1RXuOpU7tmieZwQiZby/psdb3QgRhyjU0f9Ksx+E7KY8RwwpOBwXuo+vvmnWNCrBAV6Zd10k33Ek5ayweBzxWHkYKcXJH0gDNqFm1dzxQwTw8bgXIV3X4PwC14AcUC2zh4LdlSOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725318481; c=relaxed/simple;
	bh=gozImu+0HoDnCCJ4b8zWNMbgtaoTMrYcEGAITtes0MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4wgQMl+fA5o40bDkha8h1ExDX5yROzHP8aOu9nylIt5QVBlE/iOHaLJp3cPuuSuEhWDJ8M9VjzA7wkC+mXJ4DxGxFb59NyzmmXZPN29WaIl6RoorAS7yo0cLLSfwC/XPtyFNgaCP7y8Jxg0Q5b+en+5aeEi306NTWDjfw9vlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ES5A2FqE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88268280;
	Tue,  3 Sep 2024 01:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725318405;
	bh=gozImu+0HoDnCCJ4b8zWNMbgtaoTMrYcEGAITtes0MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES5A2FqESIoJaXvIdhEvTRgvbBE4Iwfg1H5HUu4jPZ24T6OdwRhCM2hpXFwkqD9va
	 gT0PgigtizWrE6/xojndpDYWmqiLeVJkYC28Pmrycn3qwS5lmbI8XUpxxbb+/seEki
	 daJGRs5pTv4PeXpiuqv3H3cv07KwVc4z+jOEi0Lk=
Date: Tue, 3 Sep 2024 02:07:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: pisp_be: Remove config validation from
 schedule()
Message-ID: <20240902230724.GA5909@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-3-jacopo.mondi@ideasonboard.com>
 <20240831131756.GV3811@pendragon.ideasonboard.com>
 <arzwga3hfd2hibj6bllnzjs5mnm5kzih37mbe55xdgcnjlqsp3@zpwqt65eryht>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arzwga3hfd2hibj6bllnzjs5mnm5kzih37mbe55xdgcnjlqsp3@zpwqt65eryht>

On Sat, Aug 31, 2024 at 04:59:32PM +0200, Jacopo Mondi wrote:
> On Sat, Aug 31, 2024 at 04:17:56PM GMT, Laurent Pinchart wrote:
> > On Tue, Aug 27, 2024 at 09:40:16AM +0200, Jacopo Mondi wrote:
> > > The config parameters buffer is already validated in
> > > pisp_be_validate_config() at .buf_prepare() time.
> >
> > Unfortunately .buf_prepare() isn't the right place to handle the
> > validation. Userspace should not modify the contents of the buffer
> > before BUF_PREPARE and QBUF, but malicious (or just buggy) userspace
> > may. The validation should thus be moved to .buf_queue().
> 
> Probably right, but unrelated to this patch ?

Yes, unrelated, but it should be fixed sooner than later as it's a
possible security issue.

> > > However some of the same validations are also performed at
> > > pispbe_schedule() time. In particular the function checks that:
> > >
> > > 1) config.num_tiles is valid
> > > 2) At least one of the BAYER or RGB input is enabled
> > >
> > > The input validation is already performed in pisp_be_validate_config()
> > > and there is no need to repeat that at pispbe_schedule() time.
> >
> > Is that the same validation though ? The one in
> > pisp_be_validate_config() validates config->config.global, while the
> > validation in pispbe_schedule() validates job.hw_enables. The latter is
> > set from config->config.global in pispbe_xlate_addrs(), but is later
> > modified in the function.
> 
> Ah yes, the ones validated at schedule() time are the ones in the job
> populated by pispbe_xlate_addrs().
> 
> However
> 
> 1) config validation makes sure that in config->config.global enables
>    at least one of BAYER_ENABLE_INPUT or RGB_ENABLE_INPUT is set
> 
> 2) xlate_addrs()
>    - resets both bayer_enable and rgb_enabl only if
>      there's no main input buffer, which as replied in the previous
>      email, shouldn't happen, otherwise prepare_job() fails before
>      calling xlate_addrs()

This is checked in pispbe_xlate_addrs by looking at the return value of
pispbe_get_planes_addr() for the main input. That function fails only

	if (!buf || !node->pisp_format)
		return 0;

buf should indeed not be NULL, as that is checked by
pispbe_prepare_job(). node->pisp_format should also never be NULL, as it
is initialized at probe time and should never be set to a NULL value
afterwards. That part should be fine. I think we should remove the
unneeded checks, they only contribute to making the code more
convoluted. I'd rather simplify and clarify checks in a single place to
give us enough certainty that further checks are not needed. Could you
submit follow-up patches for that ?

>    - set bayer_enable = 0 if the BAYER_ENABLE_INPUT flag wasn't set in
>      config->config.global (in which case rgb_enable is set because of
>      the validation)
> 
>    - clear bit entries in rgb_enable but only for OUTPUTS not for
>      input
> 
> 
> Which makes me think the validation in schedule() can be removed
> safely.
> 
> A bit convoluted, yes, but possibily safe ?

I think it's safe indeed. But it's definitely too convoluted :-)

> > > The num_tiles validation can be moved to pisp_be_validate_config() as
> > > well. As num_tiles is a u32 it can'be be < 0, so change the sanity
> > > check accordingly.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  .../platform/raspberrypi/pisp_be/pisp_be.c    | 25 ++++++-------------
> > >  1 file changed, 7 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > index 8ba1b9f43ba1..73a5c88e25d0 100644
> > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > @@ -588,24 +588,6 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
> > >  	pispbe->hw_busy = true;
> > >  	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> > >
> > > -	if (job.config->num_tiles <= 0 ||
> > > -	    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
> > > -	    !((job.hw_enables.bayer_enables | job.hw_enables.rgb_enables) &
> > > -	      PISP_BE_BAYER_ENABLE_INPUT)) {
> > > -		/*
> > > -		 * Bad job. We can't let it proceed as it could lock up
> > > -		 * the hardware, or worse!
> > > -		 *
> > > -		 * For now, just force num_tiles to 0, which causes the
> > > -		 * H/W to do something bizarre but survivable. It
> > > -		 * increments (started,done) counters by more than 1,
> > > -		 * but we seem to survive...
> > > -		 */
> > > -		dev_dbg(pispbe->dev, "Bad job: invalid number of tiles: %u\n",
> > > -			job.config->num_tiles);
> > > -		job.config->num_tiles = 0;
> > > -	}
> > > -
> > >  	pispbe_queue_job(pispbe, &job);
> > >
> > >  	return;
> > > @@ -703,6 +685,13 @@ static int pisp_be_validate_config(struct pispbe_dev *pispbe,
> > >  		return -EIO;
> > >  	}
> > >
> > > +	if (config->num_tiles == 0 ||
> > > +	    config->num_tiles > PISP_BACK_END_NUM_TILES) {
> > > +		dev_dbg(dev, "%s: Invalid number of tiles: %d\n", __func__,
> > > +			config->num_tiles);
> > > +		return -EIO;
> >
> > Isn't -EINVAL a better error code ?
> >
> > > +	}
> > > +
> > >  	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
> > >  	fmt = &pispbe->node[TDN_OUTPUT_NODE].format;
> > >  	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {

-- 
Regards,

Laurent Pinchart

