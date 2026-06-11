Return-Path: <linux-media+bounces-64558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdRlGjV9KmrqqwMAu9opvQ
	(envelope-from <linux-media+bounces-64558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:17:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792B670536
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=ekIXc12a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64558-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64558-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6EA3334CEBA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606AB374E7D;
	Thu, 11 Jun 2026 09:13:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FF12DC79A
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:12:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169180; cv=pass; b=jUrhTXZyNYsaOpQ3poRn4HiMylrQJ5RD/WPz7E/Y2khTFBA/Q54hP0lKy7dfuzYwI2rw9tWZeEdtj7HxGz/uULoCnC27ll2iEPUUQPvAN3/cJnGpEcsCAXgpPtCxyqZU3INwcXQVcw3HViDiOLI9/GQ6qy5DepVjyTk121maC3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169180; c=relaxed/simple;
	bh=hoj0ig+CoCGbFQUO4jVjy2N6O6hJkky1VIHSBDR3r70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k015UmwzOh9dd39iazrcH2n1tJqye8RvSMznRiDACzlFKZ9riR52v19F9agXQtj8/cVca9QbnLUZLGJWUkIJBo+i1uQTLLiliNvu6TohRvglXO9xYHZBtACBzyv7rCOmfY1+7ZCAGbTSKB/lzqODEH/EzuiQlJZ2jWn+anawcm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ekIXc12a; arc=pass smtp.client-ip=209.85.128.174
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7f5eb760240so12439827b3.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 02:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781169178; cv=none;
        d=google.com; s=arc-20240605;
        b=PF9qLjLQmAxDcKYQs936iO2ViZqtJxtGyTDwMKk6rjBWMxAIE4/3tFOk58C7w7kY1+
         gkX4f+1NTm/W1JqqSvJgyCzaDNrvCZzGdkdlO/FAJDsAP8kjF8f+G4Z9mstdi19dnRgz
         S9iviZNg/qTBpM5fx7d1JQ1I1qLemYK9kqgTfkb5ZYSW4He90QXhVU17dH3Q1sScAy0o
         SpNHcKRpAf9xKcNw5/5hLXjF6Men4NL5NtjAWRQ9ml5/VGvn7Y589j046xfa/DXDXZcN
         df3x+KSmFcRmPRTzTY+6R0QzIKPBEOPVxPPUsBN//4kn+/yrbLxilhgECfpTOmQ4cVYJ
         nwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        fh=PF6aLbX0+uqhEnXasRknA/dvpw/i7FuXoP303Ev2FBY=;
        b=UWfiB+mbv66vd+lTSiJEi8xj6AA+VOKfYs66THoU7tKPKWFwkOH9CHPoAhQh1P0VOH
         LXP+DADRhMvrewDlIu38SrQXNliXTrTVY81NaaeSGcV1Wu4oKtdf9TCwxAR2ELkLzIN3
         1J6jDRWAcqkDLM8ijPPDCg1T+7PfvtyObQNZeHamqSUQWctuzAGKr0XsU9+A1yjDZgr9
         WZSY5NE6rnv3eDQkkUxS18pynDZwMk/sBiuvbcAyEJpOXeysVgi8UQ+n3AhEvDM+JH8X
         OZpYOsmTDeMS3ZrgJ8IoVIbkOmneLsNL9ROIqMooydGpgE5rquFYXTTEuh4MbAMSnYTN
         0h4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781169178; x=1781773978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        b=ekIXc12afGVdUxXaQYa5y2/VWZnuBX4t1DzfChztT7VR/BCX01A18IiP3aLdD7wUXO
         6Moo1qZIvSjzWVu93WSvxTxPh5LhTLIfaO6cJds4bK1SSV0cv80TOQcqtfBR3a/cyCvq
         07KkEGWcWzuHV2Kn/ccQV8AIYv7dY/QAAlQANNqjeloZr9VS6p63Hma6cRvZV1JBGjMS
         wNX/0euW/dyuwUw62NQVafyPz3dcllMSe3pYXMXSFh/dCZyDscbwhc+b40yPdEdf4iel
         4GvwLMSHtm3hN0SYYTsiRR31vOy39aNfn4iDEMYWFfdA1uVYW7sRRU+0IWtdMjYXE1eR
         DqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169178; x=1781773978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYKB6iu0PDtjrE3F0ztsAOmxTHIzR1YcZn5jcZ5lz6I=;
        b=INNGqvhyiJYokCjrqT4zO6Cakz6widPsdRa2/ja6tRTTA+BywPO7vbHHDgvcwFchOT
         09VlWpVBbY/vCdkRy35xyc1hQn/mzHFSgOF3Bo2mgnVr5TcaxtbP9YsJNhSJbbBNMxUk
         nkW+Uw4Blqs8Vw9FArJr0T4o4rZ/unX6hHGi2M5FJzVkBb47uIahRmOXZfkN8uIV3r3b
         LJb0fGRAtTECoRhDt4wBhqRObc6RKJ4o1MP5UaSXmKgaLi+AVR5/xQg28psA93k/mWsc
         hyAgBSSHKjMerdG653L9LM6/EYy4ihtUUU547sN4w0zbMBkJ7VZ9K7nIWeSWH6aHzDP8
         xWZg==
X-Forwarded-Encrypted: i=1; AFNElJ/5E8dTd4e5T/bGR35xXEvawqHak0GOkK0vksJl/gMxSWX3Cvl8S96nYPvswpV4zNgXAAsuFTN7I9efhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwotlObUAdWIcbuHX5t/UkutK6HNjrgL/sU+mbRNzjhny1auGUB
	tkOhut6llWqN4VzPfct6OWfJrPGHijeGfirajnbMzVeJ0q9yBJSmWRnH1Dli9BUme/4zCiODTVH
	fgJ8Fct/w/EFL5LK68VY3CwmNHEfNtfBq5bCpShjHy/BplEstNYH1
X-Gm-Gg: Acq92OFuz/ueosdT5TskCRTcfB2qDJ7+a0e26KZf9AGYIN4Eg3uyDoPT56N21BfdR7B
	1yVY0Wo9Je7L0R+cCMTJKcOnexGBe3y4Qcg7pEJZvya7c2eLESJrn3GEQ9cwEN4TKYSOGcXKNlG
	bM+sozbdserAwtzewGDrDmiwu4EpsVybjTdDZTAJH7PC328ZCJV68SGc9+pZvpwOJ5L2fmbuuMA
	+ESLL/oTcVbzpMsrsHAewSZ0HhgAFEpCHgPBMaRBGFveQvgBM2p500IyqbYYAun/mAMqhY5Vrsj
	p3GK3x1RZScK49FEWFexVX3vVuaVQZqLsWvQEZOe2rGilUJ55/Ufak/wI461pi1JRGvAfgSHDJB
	W0aEqRqFss5Rakpvz1Wzi4M9cha1fbEnBQPY=
X-Received: by 2002:a05:690c:490c:b0:7dc:605d:7a9a with SMTP id
 00721157ae682-7f655ee0d17mr21296917b3.12.1781169178177; Thu, 11 Jun 2026
 02:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org> <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-1-3c61a482a44e@chromium.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 11 Jun 2026 10:12:42 +0100
X-Gm-Features: AVVi8CfaG3sU9PQt2tyzbFw_FkBWxmHg2PzweaVreKbZNnE6xiybcEosb6zW1uw
Message-ID: <CAPY8ntD=f_S8fjOG4=3viScGMVEsHWivs7qn=X_-UqvqB791wg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: ov9282: Remove unused kerneldoc description
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:stable@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64558-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime,chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3792B670536

On Wed, 10 Jun 2026 at 17:20, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> The field has been removed, but the kerneldoc not. Let's take care of
> this.
>
> This patch fixes the following warning:
> Warning: drivers/media/i2c/ov9282.c:223 Excess struct member 'mutex'
> description in 'ov9282'
>
> Cc: stable@kernel.org
> Fixes: 0c69a963a300 ("media: i2c: ov9282: Switch to using the sub-device state lock")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks!

> ---
>  drivers/media/i2c/ov9282.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5b6f897a74fc..3ba630ec4f2a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -197,7 +197,6 @@ struct ov9282_mode {
>   * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
>   * @cur_mode: Pointer to current selected sensor mode
>   * @code: Mbus code currently selected
> - * @mutex: Mutex for serializing sensor controls
>   */
>  struct ov9282 {
>         struct device *dev;
>
> --
> 2.54.0.1099.g489fc7bff1-goog
>

