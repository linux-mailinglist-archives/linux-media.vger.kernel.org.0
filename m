Return-Path: <linux-media+bounces-51743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFg+DxkSemnH2AEAu9opvQ
	(envelope-from <linux-media+bounces-51743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:41:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDADA240E
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8600B3051489
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9974A35B631;
	Wed, 28 Jan 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QKZs5HRy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F5353ECE;
	Wed, 28 Jan 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607622; cv=none; b=utwEhhEuT62fnJeoMZKUJ9ad/bcGcNwmdNBO+GoEd+oSAigh3NF6HZzhRrsXoyuT8UuZUU4zBwyTXXNR4+iHIDB8pBKYtYzAOTbW76qtVjszfJtg1FaFLI5WZNDw8quOo6UwW+hqP4LsGzlwITqeiPn4aILUerV4D4uJH70376A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607622; c=relaxed/simple;
	bh=yYHePr1nAJTso03/awd0b1psmNmyoqOrBLoPYFzBr2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txgTr8JWu8k/8avwUt7iLZo8RM0SKMxHdDR/f3zKCZ1EbrCHV3+ycaCuRXXubqGREH3oBX+0lUxVBj+eIZ468gnPx4T9CCMOOqXMIGLSITFsSiTlOlsdkINTihsPqJbuL8bqrzSGNYE6TexH3pqYimTGe4CqtjOkZK/azLqTPLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QKZs5HRy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C1A963A2;
	Wed, 28 Jan 2026 14:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769607579;
	bh=yYHePr1nAJTso03/awd0b1psmNmyoqOrBLoPYFzBr2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKZs5HRyZ8KdLKTfquDaAnbijAOUsijL6CQPtlHMsRf57h4/ldnb6CkHqnRohKPb2
	 e7R3b1IuO22vMC5AFaVGJP1BGZrNNYbNMdETNFb3TWvoCNBva8sRcHlq/0xhSVcgkU
	 sqxD9Q07pq38qIUIhjDGAsNEfAcerQ/yD1i4xke8=
Date: Wed, 28 Jan 2026 15:40:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <20260128134015.GD3210848@killaraus>
References: <20260126083430.8247-1-clamor95@gmail.com>
 <20260126083430.8247-3-clamor95@gmail.com>
 <aXc1XwD8Wo2yu4dv@kekkonen.localdomain>
 <CAPVz0n3=JPyjm3RypcSec=FZ66W2cq4Mwu2yodR03Ng2jDbxEw@mail.gmail.com>
 <20260126100554.GC593812@killaraus>
 <CAPVz0n3mG79Q0E=F5a3iSdd9TcVXFXuLj9vFkX3if2zVzpR=eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3mG79Q0E=F5a3iSdd9TcVXFXuLj9vFkX3if2zVzpR=eg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51743-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EDADA240E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 01:50:13PM +0200, Svyatoslav Ryhel wrote:
> пн, 26 січ. 2026 р. о 12:05 Laurent Pinchart name:
> > On Mon, Jan 26, 2026 at 11:50:05AM +0200, Svyatoslav Ryhel wrote:
> > > пн, 26 січ. 2026 р. о 11:35 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > > > On Mon, Jan 26, 2026 at 10:34:30AM +0200, Svyatoslav Ryhel wrote:
> > > > > Slightly different version of MT9M114 camera module is used in a several
> > > > > devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> > > > > called Aptina MI1040. Only difference found so far is lacking ability to
> > > >
> > > > s/Only/The only/
> > > >
> > > > > poll STATUS and COMMAND registers during power on sequence, which causes
> > > > > driver to fail with time out error. Add polling flag to diverge models and
> > > > > address quirk found in MI1040.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
> > > > >  1 file changed, 28 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > > > > index 4ec033c0ee84..d96a57ebcad4 100644
> > > > > --- a/drivers/media/i2c/mt9m114.c
> > > > > +++ b/drivers/media/i2c/mt9m114.c
> > > > > @@ -368,6 +368,10 @@ enum {
> > > > >   * Data Structures
> > > > >   */
> > > > >
> > > > > +struct mt9m114_model_info {
> > > > > +     bool polling;
> > > > > +};
> > > > > +
> > > > >  enum mt9m114_format_flag {
> > > > >       MT9M114_FMT_FLAG_PARALLEL = BIT(0),
> > > > >       MT9M114_FMT_FLAG_CSI2 = BIT(1),
> > > > > @@ -421,6 +425,8 @@ struct mt9m114 {
> > > > >
> > > > >               struct v4l2_ctrl *tpg[4];
> > > > >       } ifp;
> > > > > +
> > > > > +     const struct mt9m114_model_info *info;
> > > > >  };
> > > > >
> > > > >  /* -----------------------------------------------------------------------------
> > > > > @@ -2186,9 +2192,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
> > > > >        */
> > > > >       usleep_range(44500, 50000);
> > > > >
> > > > > -     ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > > > > -     if (ret < 0)
> > > > > -             goto error_clock;
> > > > > +     if (sensor->info->polling) {
> > > > > +             ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> > > > > +             if (ret < 0)
> > > > > +                     goto error_clock;
> > > > > +     }
> > > >
> > > > What does the datasheet say, is there a need to do something else instead?
> > > > As the polling is there to ensure firmware has done its job, the need
> > > > appears to still be there.
> > >
> > > MI1040 has no datasheet available and downstream code does not do this
> > > polling. I have tested on Nexus 7 which has this camera and it seems
> > > to be fully operational without this poling, but as soon it is enabled
> > > camera fails will timeout. I suspect that this camera version has some
> > > quirk regarding early access, but I cannot back it up by any
> > > documentation or additional data.
> > >
> > > I have a device with proper version of mt9m114 too and it works with
> > > his driver without any major issues.
> >
> > Does the device reply to reads of the MT9M114_COMMAND_REGISTER register
> > but never shows the MT9M114_COMMAND_REGISTER_SET_STATE bit being set, or
> > does it not reply to reads at all (timeouts on the I2C bus) ?
> 
> I have re-run check on Nexus 7 and TF201 which both have mi1040 cam.
> 
> From data I have got:
> 
> "mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);"
> 
> passes fine, which is good. Previous time if failed with Timeout
> waiting for state and -ETIMEDOUT. But
> 
> "mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);"
> 
> still gives:
> 
> [    2.921791] mt9m114 2-0048: Timeout waiting for state 0x52
> [    2.922777] mt9m114 2-0048: error -ETIMEDOUT: Could not power on the device
> 
> commenting mt9m114_poll_state made camera work, I was able to take pictures.
> 
> If you have any suggestions for testing, let me know.

Does increasing the timeout help ? I'm wondering if this patch could
just work by luck, with the sensor no being ready quickly enough for the
timeout used by mt9m114_poll_command(), but hvaing time to get ready
after power on because the driver doesn't start streaming immediately.

> Additionally, not related to this patch but to mt9m114 device tree
> reflection. The MT9M114 driver exposes the IFP device's sink pad
> first, which causes issues for external devices that rely on the OF
> graph to get the correct pad information. Laurent, may you consider
> swapping sink and source pads of IFP so that source pad is set first
> and correspond to device tree port or at least if you and media
> subsystem maintainers are fine with such change?

That risks breaking existing userspace applications.

The issue may be that the IFP entity doesn't implement the
.get_fwnode_pad() operation. You will also need to make sure that the
downstream driver calls media_entity_get_fwnode_pad() instead of
assuming the pad number to be 0. Could you give that a try ?

-- 
Regards,

Laurent Pinchart

