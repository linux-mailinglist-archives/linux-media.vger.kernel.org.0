Return-Path: <linux-media+bounces-57161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPq9Ef5VxWkk9gQAu9opvQ
	(envelope-from <linux-media+bounces-57161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:51:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C614F337E14
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E14A030CA140
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B2F402429;
	Thu, 26 Mar 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia0N599X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92CA2DB789
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539243; cv=pass; b=VxhdMmIt8maJHXKOnOenskzoULv7yUGLHnrZwmTlJsiZudtqNBRGKSbKQQLEvKQATRySd1rmCAjO/u7mfM70YLBKjAfaKJC3JgMSS8KVChkXaYklYvsxtImnuyazv7Ztz4GMp0kT9X9V2RdFnaQpQHKRHbsN3ExZMmSlkvbrQyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539243; c=relaxed/simple;
	bh=QHDDHO4LVVYxJRc2Eubtw5cGEKghDTKOLbul4jNp5LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaEhrMh65N710VoWzkylNNQ8DqT94A6AOW90axe3b5DdTD8nTQJWRndGhNjXtYDz2hFM3oO+Xhn0WO9xpS9DqIraFtNrj7+X0sIHocFenTO2S6plHpDKoPJ5LS1uE85xtSJF+8uhMSBoYijms1+QxH24zen4R/PGJ/k8Ed0zhmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia0N599X; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso10090815e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 08:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539239; cv=none;
        d=google.com; s=arc-20240605;
        b=CyK+UIhMqD/+vBvkKmr0GWUQ5FtHbbceB/D2Nzl2vhKwifacnSCNW6nJHbRZXYMIS1
         1WdNYyuoufrmOCfCY82QO4aJ6vKB0kaInjeAVCrk1N7cM8f8TkYnBbejbFW9kfzPAJCU
         FZe3plov9Du1GHE0k1pXbQ2n5YJLJFyAk/05IBos+3zFq3yr4nXt9ndvjGBmdZjR7Efw
         bDye2KH24UCYpfpy3reH1YNU1V66vikw4zBADGT8g0W07Hid08HAZo/ryiW3liPF8Nuc
         fke5bAnkU3bY+lUx/G5IKjEyUi25+Sg/jTl3rH1RKtKrlm+YloNuJV8xhA+/G2i4n3ds
         29Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        fh=RmdPtVfj85E0tESg2HOwAZizghyrXqV495QnqQdcZBI=;
        b=drcS3wD2Yw6FrsWX0UNnDF2g39TCo8mGlYZXXuLLKv3/ShIQrj9D2j2D6nHIZLv123
         tFQnEO8yecR+wESnkeAMz9g433zvcKBKF250CbIYXdXIB/XLuxtWFwDlKZRvWE8Xkp7M
         2gTOMu7rudAu4dAw/9Cijc7SkCF3NHDVaCg7Zczzre7g6/MUVlsgWPSgWm/h7RQUFRId
         FVEE2faReNbiJ9dX38CtQYlZ0Hy/BZCkvukUUkFJ78k9GkNZrUn31aOMzZSFPGh/I2y0
         j2iGaPuZvUIhfE1AFaE0NBTbKgHRQ8sdHn9N0I/HtQZzqiQcWcasdpEgZoM1s/Oy4t1a
         H0lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539239; x=1775144039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        b=Ia0N599XwSCAth6j6XXDtr7IRFq8tBywK/o/pfogKyYDFB618LrYDe0fioAh/6Gjtd
         QoTRqBCdBWLrgyezNaM34SGYrJjVeVTV4DsdjJ9etTYZmB+wpUorcqkCn1SsnmKdMAZA
         8hRWXAOGor/0/wZKZXNVve4/3YctGvHd+AI5ABZiaLvwilvdg+WQ+Q8Ps/noR2xTsZoO
         2CqksOFDY99mwBTXcU4isR0rQ8cbhmEcDn2YKVZwrmNYWMcX/9rGBSbJ4PCAV6vNm6Dr
         xUrHhLyCJznlhoDkB1R3YogOIFWhjmNRwuWOM3TYNDv8vnkOHbMhfotTIQL+0ncvF+Cl
         qDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539239; x=1775144039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        b=h8b7Gwz3yEX/qHCbZZpfLHxX7CQYqYVHjg7eJBVVKLJXkR+k4+B9CKbFUNa4AXAgDA
         ek8JgPNoYuyOtPOuMBKqn9bJcfvbAH0q2swaopexnQ2snFGKmuCg5UGi+49BYFOOGV6P
         YOhDVhwHp83Q80Mdc6v5kaXutY9Len1l9mdmjek59zUssMLRD6bqJVD0lZcg8CKib/vI
         3PST0MzyS0qYkqW3dBQ9CJIXwGnZ2ARdCPF2hysOZDqVqpfFhfdvZuY2WCB3TcdR1SIp
         fdW/dk/HM7dBmax1RzFmRlOuS49O3b0dzxJNJhWbK6KxQOogUwBJbJV/ddE1RmATWogi
         f1vg==
X-Forwarded-Encrypted: i=1; AJvYcCWK6oGmzSJIcFunf7oHWuBCPnZRYR0DuN1vFlOf7ELhAcP3BYncmGl5NY86PV1pcXKkcD8Dtb61dSw9vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxROsrEQCocImth7VIA7MGTXcYAtRcK7k9GG8x1n43q4Y0ogrG5
	1KUmGWuRBCSFofV9/UohBowjoHVFY0GK+19WD6g6r8gAWmvIB2wbtWUQA9TC/QbAulF6ndCJ/r3
	9H/AVsflgvItIkcbgHdWyUGHdOYHHmQQ=
X-Gm-Gg: ATEYQzzfhJYUI4brp1+h7ml7spzP4BPUXrkvUdSWFzHKGwBShczOlLukd0uwryx0I+F
	DI3VqXZ1OHjMEhpDLJyo22INtH6CTpUgXe6/ftgIt4xMnMXvO6IqQGRk0s4lyOqo1bdBAupbUq2
	+wX7mBWlge12CKFIIu0tvTm9tKJHHRUYVFtJ9cxDou4IVFJ2fq0p5mLylB2BADGlnSsNUi0Qmp8
	+BTXqGjsKbf2JS8+JHuvAts+PYjlbMu4LLc3ujx2hcRdTnBP6+d801OoxdgKAGo+ZZCFKcrGDht
	iwlpOpuQvIpeClIBUsMIZmUS6VRdjZPPl/ZHfQgrhBX/UmAXfmVsXgKKnnGR69lbTTfx8Q==
X-Received: by 2002:a05:600c:1548:b0:487:716:2fa9 with SMTP id
 5b1f17b1804b1-48715ff7a16mr134430615e9.13.1774539239050; Thu, 26 Mar 2026
 08:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260326142107.297811-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <bb172420-e19d-4844-bbd7-a6b6ef5dbab5@windriver.com>
In-Reply-To: <bb172420-e19d-4844-bbd7-a6b6ef5dbab5@windriver.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Mar 2026 15:33:32 +0000
X-Gm-Features: AQROBzAn9bGjSA_U9-7Bi0VG3hKZ4DZaBmDg7pB_PzCwe24_K7xtnvK7QMBK2-o
Message-ID: <CA+V-a8uuT=GEFGQXfXPc6KzPqOdTEjUxyP92f_YUzBq9AzUKVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5645: Convert to CCI register access helpers
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57161-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,windriver.com:email]
X-Rspamd-Queue-Id: C614F337E14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei,

On Thu, Mar 26, 2026 at 3:00=E2=80=AFPM xiaolei wang <xiaolei.wang@windrive=
r.com> wrote:
>
> Hi Prabhakar,
>
> On 3/26/26 22:21, Prabhakar wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the ov5645 driver to use the V4L2 CCI register access helpers
> > and regmap infrastructure instead of the custom I2C register access
> > implementation.
> >
> > Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> > a delay between specific register writes, which cannot be expressed
> > through the generic CCI multi-write helper.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/media/i2c/Kconfig  |   1 +
> >   drivers/media/i2c/ov5645.c | 901 ++++++++++++++++++------------------=
-
> >   2 files changed, 429 insertions(+), 473 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 20482be35f26..921186d36589 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -526,6 +526,7 @@ config VIDEO_OV5640
> >          tristate "OmniVision OV5640 sensor support"
> >          depends on OF
> >          depends on GPIOLIB
> > +       select V4L2_CCI_I2C
>
> The V4L2_CCI_I2C select option seems to have been placed here on the OV56=
40.
>
Ouch my bad, I will fix that in v2.

Cheeers,
Prabhakar

