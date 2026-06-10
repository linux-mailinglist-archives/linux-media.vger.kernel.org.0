Return-Path: <linux-media+bounces-64524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R4EEMdHhKWrIewMAu9opvQ
	(envelope-from <linux-media+bounces-64524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 00:14:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881866D2A4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 00:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=hFouPLr8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64524-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64524-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7171230331B5
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 22:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086C6363C6A;
	Wed, 10 Jun 2026 22:14:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5B2C031E
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 22:14:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129675; cv=none; b=n6BcBwnqUCWgpRxvU0gpbPlf1WpSxY7bvU8UeROmNvPQRW05U1bRtR1SXqqCa/5XzYKdFXw82OaN2LboBUvgMp7REPiickDq3iTYaftWjapvPRA7oUqUDR9QIzSz2mCRCHxzPCBr9gQ6lwpS3P3jjvutc0AEhAEwWACbDAk1lz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129675; c=relaxed/simple;
	bh=mTLDVINarZaJr5azCL8guqrK/oiTW8Ahtnhf4kDMrpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5/CHfgHtVkMwIOhnKkOMMkWJCHG3ji73KmJbJzsSkTkToVNLXLAHwbbm6jKrqyLmH1Nj4SK+vKmVkn0JidEXaTHvUUfTaUC36cYA8X6C3iVZdpr5XsQDtaczfXnHR30Rd89OEcyYw344AfEYIRIpHKeveXXZ/fJNo5ZzsuuI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hFouPLr8; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bf84a2b2077so428395366b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781129672; x=1781734472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBH4Ky0PfRH1lV1hmQ6CbTQcq6+3YnY1hBMssQPxZyU=;
        b=hFouPLr8Jm8a5/778n9Y+6rC1nioKK6mstOVlbeFslgiBKWrXPmb8Jo/DMCvkYbIwX
         Eh2WKHv8UtDclploy+m+UpRoN8cVFsT8ZqXhc/bFJOaT8SHF0+GvHPlIhefIHxfkcXkS
         GV25AISFsNYLr0BqvpBK7RALIMpXUrxSS9brI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781129672; x=1781734472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBH4Ky0PfRH1lV1hmQ6CbTQcq6+3YnY1hBMssQPxZyU=;
        b=Z0Sqfoa5JTTYrjx3yAzwHJXVh5ttqK4Prayr7tDL/7qZMYpBBd23UVyG/0Rg5of6Ma
         SbsT+8psWU4Dm172XzES2n7O85ysghsCnHU+MO6DAgtYODnnlIdQr8UpizktcFFkRggx
         LUJAZD6UL0sJ0u6bH6+K8Tbz45P1t8yxnJ8eZQlxI0gB/t+LUpmngRGA/r81TMHkWBDJ
         6H0QzXbqZRfyovMXbJLeiLW9ndn3kPOYK7WdwIxuH4oVtuJV5A52UJ+fB0uC6+e3RnHd
         wQK0cshRdBFDTjR2HpvRvZOVDeI6X8FSY3EaqMslDhhhOYam2OA20F7NNZkb6g9BA47N
         nXeg==
X-Forwarded-Encrypted: i=1; AFNElJ+HEaMia2D7L17FOHeIP9g8TlnaBwMJU7yYJcginEXjrQb7VTQDXXYbo93PJiCoTT8D/wnWeco4zMU67A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqwVaXpYmQXcemjQxAQPBdUbyxYcAy9rjZVqZ0FpsK56ZJoLUr
	Yuq1uPlNQhlWV1btmiYMEsLEz5CJhrEo35jWSoNDIhAMUuwrOQ8KFgvnaciqJAH1fbkKAv9Y799
	dTtZM7oEA
X-Gm-Gg: Acq92OG5v2l2ByJma6qrQoYjmvJR3kKiQFADtRXEB7EQWhmKO0UkX2UPuTSAjlM0brk
	u+wRRnnB1qUs3XuSPiWQCDgYZmxW7l9tX8iaS52yPVl7oFW3xcYJdv1ketWqfrHbdbywlyxIa3E
	kMaMJWaZAI9QTem4tNsT8m1+20QC41dC9aYr2INDa9W66DuzpW2CIgQa89CihcOFlOB69zVX0wS
	YdFc8FKsKjOXioNVCEQqnoZO5LDP8rGxNpeZ5AQSX+ndQBlCrtaQhxk7U5ODkIX5PEJZdpJGN8k
	dHG1OIMugBdBmp+w0cUIjInNsBYv1zbgcCu9+mczHM7JI+6YkJYhAr6uccnqw0S/O8LChZuIhzw
	eFUUtXzfz+ZNLkfO1D9j0NbcvHnKtf9f+g9EDlojhIg7PrZFFGq20uJEKsMg7pjbNZMsJZ57WPv
	WIeK8uX5rRWg1U2Dr6KUabeZLaL/G1AdUVzGxfc8MGtHmqQXnaVe7gcR0by9KY4UV/0GrHEbybV
	NNnHQvIjQ==
X-Received: by 2002:a17:906:8a70:b0:beb:b53d:4839 with SMTP id a640c23a62f3a-bf3738f4334mr881995566b.33.1781129672505;
        Wed, 10 Jun 2026 15:14:32 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1245456266b.11.2026.06.10.15.14.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 15:14:32 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so10475079a12.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 15:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Hid+cgjyg/xc7S/o9baRql4rvYJPgvB8TRlRpjhnqGzaJjNxGv2j4y5lP3X1zu/DXw1h1j0Gg8my8xQ==@vger.kernel.org
X-Received: by 2002:a17:907:1988:b0:bec:203f:7466 with SMTP id
 a640c23a62f3a-bf370e629dfmr1399587966b.8.1781129670185; Wed, 10 Jun 2026
 15:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org> <20260610202124.GB1384932@killaraus.ideasonboard.com>
In-Reply-To: <20260610202124.GB1384932@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 11 Jun 2026 00:14:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCsOdB7scqmLT01Ehe7gDaiy-5HX1NfPOtgQHi+vNbd-tQ@mail.gmail.com>
X-Gm-Features: AVVi8CdTF4yTQJtqiEKlYfBQtnih2Y53iWj-G6zZEOegl5hWcbxzOEozFhI30IQ
Message-ID: <CANiDSCsOdB7scqmLT01Ehe7gDaiy-5HX1NfPOtgQHi+vNbd-tQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64524-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3881866D2A4

Hi Laurent

On Wed, 10 Jun 2026 at 22:21, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> > The variable has been previously removed but not its kerneldoc.
> >
> > Also remove the leftover reference to state in the description of qlock.
> >
> > This patch fixes the following warning:
> >
> > Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> > Excess struct member 'state' description in 'rzg2l_cru_dev'
> >
> > Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
>
> Does it mean that this patch was merged without going through CI ? Is
> there something we need to improve in the process ?

Something has changed in the kenel-doc script. If you run this in
media-commiters/next:
scripts/kernel-doc -none -Wall
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h

There is no error.


>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 5bf334e173d2..b426bc7898bf 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
> >   * @scratch_phys:    physical address of the scratch buffer
> >   *
> >   * @qlock:           protects @queue_buf, @buf_list, @sequence
> > - *                   @state
> >   * @queue_buf:               Keeps track of buffers given to HW slot
> >   * @buf_list:                list of queued buffers
> >   * @sequence:                V4L2 buffers sequence number
> > - * @state:           keeps track of operation state
> >   *
> >   * @format:          active V4L2 pixel format
> >   */
> >
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

