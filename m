Return-Path: <linux-media+bounces-66397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 73zLK0OoRmqMbAsAu9opvQ
	(envelope-from <linux-media+bounces-66397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:04:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B086E6FBD31
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=AWsTbCWR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66397-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66397-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAE68326784D
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CFA3246EC;
	Thu,  2 Jul 2026 17:04:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66343093DD
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 17:04:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011893; cv=pass; b=Im8PJS20cLoOUWShsMSs7uT3E5Zdoct273jPsj8MKtFjHnfllmHOlA/npE3lTgn6Uv2XF5ikGOCURAHRFWCXriV8JeG+8OPGE5992yjAOKEX+iGNiK/VDyd7BCBDJlIaoC608Npa3AsgOwgXzl1AoIfUTQyo6i1XhJQOgZfs8e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011893; c=relaxed/simple;
	bh=TdkisWdcgb45pwQdjAyEdDByD0+ba4ZS8eqmtiJAZQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHV6MJdbSM/n6TSAs9204dVyHi57ySwNQW4sdvmcecKBxxP8WP9Fm8wu3ZzpXW2xQEzXDZIE+t7QKK9+c094OCTzO/ueoim9DR4ntoO07H3lgmioVeFC6qSW+N8NUszt0hKidffeLX6QIPwXdzq+hcQpO++GBRI39oEp3RG5GNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AWsTbCWR; arc=pass smtp.client-ip=74.125.224.52
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d4478a64so2479503d50.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783011891; cv=none;
        d=google.com; s=arc-20260327;
        b=egzn5pb9vvwxvEv+J+zN2YMG4yBSeGD7xgsYNHz7Rb9qlXy4Q/T/Re1EFcNAjDmVXC
         PMrwopsf0X49UJVwK5n3nW6ZyxZIfleUirPDMtR/w1ZBKf9W25DCBdi1SuQwGHldTysX
         e4hGeg2MxiopIJAs3E3As+8eYwtijQhI3spZh4rC/lZ12jBOKSAGY0Ck6JVrJEw81vnf
         r6cktmthYHT0R5SL1YNS95kmWGwBLDzoqXtfZzsap5UqdE9a71xGeupsA2bjCgX5rtWL
         rkvrqkxU2ExkBa4w88am5uNHxRhfkgQJQkhldqZNjo4MXyIyfKpy74D9GzIbalXkTcef
         eHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R6z8Lt5Utqd6TRnZWBN/IhfmXEw9DXhrlK48qzxxz2U=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=cASpQg8Xq2C+/vxNL35/E5hp90wVNjsBw+jCZADa02K+ZmntWyLKLFMifay01r92ue
         +OVxgEfZ6wjHID3JrK7s5mS/vH8TJyx/IjBP/4Jx1pVuq+GqyHsp8wD0UXcEY3mHBBK0
         WYNUpQVNC4UCiP5XPFSJvzqJX18ZpH6Sm+Cvc4Q2G9t/p+pnvV3iFQeKxYnErsTOyB1S
         +vjj7yjIDHR/cl1L/7IeUh8LenICUQPUGTx5l6Wziu/62uZfgt1zhD5MPHb676XzqaoC
         9Tv1cOZgCvgDbPJpy9rsWyrddTySrvaQ93uLKfqwMlcms08Hsxew4oKoC5ANlE7zsuyS
         KMSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783011891; x=1783616691; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6z8Lt5Utqd6TRnZWBN/IhfmXEw9DXhrlK48qzxxz2U=;
        b=AWsTbCWR6bZ1BPV4CAhZKsLk3ebKmtnwsoymOzKzk+ZV+shkg0rHCix8zgD7nnAWro
         lfLjNpF4EWZCjFopoMqmpo6B7OjjnkNzA48p/6wSNlrdPUFMmKAC6XbPZO7FILluvyIq
         xvH3nzkmZq178vDcPCu91TLy/zZM0g/p8xErMHJtujLB/iewRm5TEERg7yIzbk4MMVw/
         7etV2asi9Q2jHV1RDmdWO/XCu8Cw0LFQXRYlfxSEgznWFcMdVhtK5oDjIowPYoyDMAoq
         Oqaav/orumIvF0b0cGBl3/ClBOpmfJPdfrcl/++u96xsp3BorAbJSRYutUOAnCzF8N9S
         oJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011891; x=1783616691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R6z8Lt5Utqd6TRnZWBN/IhfmXEw9DXhrlK48qzxxz2U=;
        b=YjWCGnLq3Z7M+DzmfIVRDjxkE3+UOLuL9zn+Wgxoh6OeaY3YxhAeiGClzyVyVOWgPl
         Y9wIDdZ4lPZCEQz0m5c64GIt4qJXTmhanvmndpEUtIb++WY4MjZfSmSR1AfCvEIsDcTj
         bNGpf/vf1J1xR6nz/WDF/iv47PYaJVS6tXOfeJRaKx1A/znwq8P1vTjeaiGrqa5jEbuX
         UMIO1cHvjgi2to12nVGQ+ckUX8yS3EFRm+Eb/HjozrDRoLTwB3RoC8MhMUpxXs2xN+WW
         OEe+urkz6XZKbu56ZcgXu+PqvNGfat7wc7ZNAvN6QEOjHaXUMHH100XSvnF3RHcd3Kl5
         fUBQ==
X-Gm-Message-State: AOJu0Yz3wM4aou9b8J8fDMCWK90tx2jTR8LfUDViIg3xtFYB8sR7qrYl
	yHSktHby9sZFcPtl+ozyA6bddOTmFeCuBDeXWjARkaRpB7L9BADThapIVz2e+i3HWM147lmJ5QN
	Xu+9rEiL7KyjjR38hqB0GbACZH+du/dI3OpTSnw+JfQ==
X-Gm-Gg: AfdE7cnOzz6WbBye5/rQ32fTp0puoFhYBv76ZK17wmSafrwYIDZDm1ToI9tnLsSTyGU
	xzG5uH/K0Jty4aGhDwDelXBUMrTghMJqz5Q4kXHeyDJdd4j8lmcE+f9S/6CAiZ3mWVEduNb9Hz2
	tQwePFsn2IuCtzR80j8X87rdSC5L92NMfAEpgkoFeoWOdgOAkhQomdkIUqJrC0Tfu+D6EvvTrIn
	FsFt2LNLyUMDGzt31Rg5u2cr4XAqAFoqZcuWQnfr5nlQ1yv3lkP/A5zwozlbwiGRgSD/XyWfbDU
	QfBHZrRYmonqFF7MQVcXRVMW2bCXXX5X8R3B8djYiiv7+tjCP5yHJspLleQKLL/NI2q+OdvVjPJ
	cTgssYBybDHhDJw==
X-Received: by 2002:a05:690e:b88:b0:664:d71f:4e90 with SMTP id
 956f58d0204a3-66521670d1emr6799343d50.0.1783011890664; Thu, 02 Jul 2026
 10:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-4-sakari.ailus@linux.intel.com> <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
 <ajPLEfuiCN9R1ben@kekkonen.localdomain>
In-Reply-To: <ajPLEfuiCN9R1ben@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jul 2026 18:04:34 +0100
X-Gm-Features: AVVi8CdXdDTNapbfIbf61q6MdiRCdVhS2Jjf5pjbUBQ86d6WzIkvI5XZoAblmxM
Message-ID: <CAPY8ntAfxvFRgHKYRT=ZLOL7L2A=GLQ-kuhYjhgTob83purBbQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66397-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B086E6FBD31

Hi Sakari

On Thu, 18 Jun 2026 at 11:40, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Mon, Jun 08, 2026 at 04:42:44PM +0100, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > The rate_factor multiplier is used to multiply a few values in the
> > > sensor's timing configuration and the exposure time is one of them. This
> > > also needs to be taken into account in exposure time margin: multiply it
> > > by rate_factor so that sensor's exposure time margin is respected.
> >
> > Testing the 1640x1232 mode with FRM_LENGTH_A set to 0x288 (79.07fps),
> > I can write register 0x15a (COARSE_INTEGRATION_TIME_A) with values up
> > to and including 0x284 without it affecting the output frame rate, and
> > without image corruption.
> > With IMX219_EXPOSURE_OFFSET being 4, the current code implements
> > exactly those limits, so why do you believe the offset should be
> > increased?
>
> I agree with the upper exposure time limit (with FRM_LENGTH_A set to 0x288)
> and the margin above but the issue is that the driver only implements
> these limits when rate_factor is 1.
>
> The margin is subtracted from the frame length to calculate the upper
> exposure limit, but as the frame length in lines an the exposure values are
> divided by rate_factor, the margin gets divided, too, resulting the
> effective margin of 2.
>
> I tested that setting the exposure value to higher than FRM_LENGTH_A -
> margin increases the frame time. This shouldn't be the case i.e. it's a
> driver bug.

Having had some more time to test experimentally, you've convinced me.
The delivered frame time does appear to get extended if the raw
register value in COARSE_INTEGRATION_TIME_A is greater than
FRM_LENGTH_A - 4, so the exposure control needs to have the margin
adjusted to account for the rate_factor division.

For reference, my test setup was to run "rpicam-hello -t 0
--viewfinder-mode 1640:1232:10 --framerate 10 --shutter 10000" which
results in FRM_LENGTH_A being 0x1403.
Set dev_debug for the capture device to 0xb to log the The timestamp
delta between frames is then 0.09999s
"i2ctransfer -y -f <bus> w4@0x10 0x01 0x5a 0x13 0xff" to set
COARSE_INTEGRATION_TIME_A to 4 gives the same delta.
"i2ctransfer -y -f <bus> w4@0x10 0x01 0x5a 0x14 0x01" which would be
the max register value with the margin halved gives a delta of
0.100028s.

Why could Sony not just document this?!

I'll double check the behaviour in your v6 and send a R-b tag.

  Dave

> >
> > To my mind section 5-5 Frame Rate Calculation Formula of the datasheet
> > is fairly clear with
> > [ In the case of (frame_length_lines - 4 > coarse_integration_time) ]:
> > Frame_Length = frame_length_lines
> > [ In the case of (frame_length_lines - 4 < coarse_integration_time) ]:
> > Frame_Length = coarse_integration_time + 4
> >
> > The register FRM_LENGTH_A (0x160) being in units of 2 lines doesn't
> > change that calculation.
>
> --
> Kind regards,
>
> Sakari Ailus

