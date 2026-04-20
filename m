Return-Path: <linux-media+bounces-59118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPpDHCzN5WlIoAEAu9opvQ
	(envelope-from <linux-media+bounces-59118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:52:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA24277A3
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93B363035D4B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B6A382F16;
	Mon, 20 Apr 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOCEq/Ud"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A0382F09
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667639; cv=pass; b=OSMB7RqKeue3Bres7XZ3OJcb5+gjaHLvRclSflXjtCgJBeOS4dObTWf1s7LhZkI6nDDA5fOThSjEOp0Q99dpcEdfmPqnEPbEU4rBUt/aAbMthDEsC2PKvrYkdXslIsz3Uq38KUcrK1IFVcAoVKJwWFYv6tTNqkwboQu0s7Bmkl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667639; c=relaxed/simple;
	bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4sk9ObIHYnyJjdHq3vYn2ZDnkr9wmsW7fVX/9TNv1FeGkzDXpx5dnMxMotEafSXiKuILxSQu+xFq+JNE3OO6Z3Ws6wgwzqLt6NAztXA/axypaVi4ED5kLIdLB+pNmwptEhhbom25qzz8uZIozjov1/77DXT253SNY1DmOWQaoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOCEq/Ud; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba25fd27571so385317666b.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 23:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776667636; cv=none;
        d=google.com; s=arc-20240605;
        b=MA7HDghzyXmAOJSrYLMoph8kzZvjjdqU2Vp0oxKQNkGTxXAX4z57XEgkYcuTunjAfT
         Jwiy6lODmATp4johqKfMOt4yuo9De+AswmXIZWklXqeoUbXeGqty+RfXTQotBDTYggzU
         qAo+AXie1gv+muk/DVy7PwNoynCUxkwZbulmX/Fy6xuVbGIzRcxNNgwwQ9T9kHaN35WX
         AIOlIUD0aplHoXJdnw+JfIXWwe0J0x+2azT9uxCZwb6Q1uvejQXy62jXz7Iv31blLUEI
         s+P7M0DQoSSIn8EvAY4rXy5g9AThzHixNfjuBUDEYWOrd6+Jmkw73KQE75IpeOcZ8wBp
         XKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        fh=uTY92wr8RvGVvjnrYfRLecw10c1NtZNrVms8xNhcFF4=;
        b=cfM0iv2og1hepnFmuDc2WvfvOFtQV6tdMGHqVQ1N9z1w5A8P3KLZJ9vNax58jQXCbu
         0WEvrxGNHGK9UpAnLAyf5ZdUXcfjcjnJ7SeC4/zxnftGFMahP8XcQXSGR6477VmHzI5v
         7q5rRoePH1swXBX6t6ByJqorhAKqEDb/gC5nRo4O5T+qSiSrSD3e802l+XAJr9vnsatF
         zBQcsvo41LEQjoKC3bgxwt6pC1/+Fdms3dk8GsY2fqM90UFttlukeaY8u5WG47da/9MK
         MjestPx3PUNYkS1z2Ra3y+eA6IwKOHfPNs5Fn/LvQiDlyQiXHxnNSNKwG+fEcMCPUAv5
         FRDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776667636; x=1777272436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        b=TOCEq/UdT2mpCNaUaQJ78z78SF65ZJTWfDQbk0FTVlAxzPUACM+oRtL2NpAb5FSVDZ
         FNntrihkCvwdtNyndFJO1mz1/kZyu0b4sFdYSUhOP0dKafq22b+CuXCg9O8f3O2b3Onn
         aDBucBDqreHriTtZnBNnsWbw4FdbcWUlZAMUscfnWfciz4zjjKXGmjSDjnLnALbEPEnj
         y4cw3Wziq0eZTeUY8BFezYTKNRd5BtamoWhy5MMTrUTaIofikIVcL3B5qaFjiZ6M60U8
         XRUxS6DO31v+Ej1p26ZkUT9Ag0HqTHkxq169TYDsP9T4WOiu2Wq962ESJOjxJ4O48K+C
         Eldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667636; x=1777272436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1haeHF9uSlmHMWw+cJ4oHIeP1NSc5nux6yAR2Hd7gE=;
        b=gGQXcj8VULJa/HMadKBRihngYinaJ4fa6d4p6V+SQTNflycw1K/+vWqWjyfTCfmK0R
         rSxZL752i+D77zkod536kiqbFZX4/qhR9BJD2blVVq6L8hBos18EzniUuvY65mXJLjNO
         38hW3sD30HiRjh5X5Pkfc7uNzU9SI6Inck8N/kwxgSbdXhzuZhsh+jVAWbINBBbGwyYa
         vfQZQS44+lYrJIBlBa7v7NI+lvs3evkyT9dKa4RILf3f3wj3ytf2FFXgUvl4K7l+6gf3
         yAAMv3SgsSBDxuOL8g2tX22gwxSrGwbG7b/e0JJW3IWkSNIHOaMGUrfEOtPr592iGhuz
         Vw6Q==
X-Forwarded-Encrypted: i=1; AFNElJ//hmHPhv+N0NSr2Jg9dBtq3t7S5I5sEwk/R7486kY7OwzTupT6ymFN/OO1xAacK7r904r4ipDBYqYB7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQs8gJN7Y/4t5WKfmSTXTEjnSEyxeXWPN8n/s0bcyjxhdDYQhz
	biPo51lmOt19W42L++VYqQRrBx/+S1R+LNHur2NYOXRwTF2iaMt6k3VoZL8xu+bJXaVp/kuk7vr
	JB+k4NV1mMx7pNXwVsVUf8xO6as2X5A8=
X-Gm-Gg: AeBDiesJdzd/sIh9Oql++xvRdPyCn6q/stgmBnXW48AvNhCe5beFivXBJeXwsOXe5Hd
	TFV/AnFRzEwqK+8b0o42hiK8Uu883N9Ut4fyTkr4vMaDsnaIAfAEXwYtVIMk0KBu/ht8rpnoxa0
	7rR9uiu6x9FLbffIqoKqXWUekus7RpqCkYRCI/anMJaW7BjbgQnFXT/JPtyvCQuG1nTXqBf3Ttg
	3U4V6ZTGAzXeHhOaS4rFFFlziGvk7m+jF1BqSsKUYIf0A9YKN5dua6WJ4rObvsiPmdYewW9b8qd
	KJav/IkvR+Mp5Xi3fY+iAonHSrJBaZWliYJPW9zxMrfT8Tv5NttW7PKHnN9sfh/x8TjgOrXFxpV
	0F5YyAt1GeRD5e+xupA==
X-Received: by 2002:a17:907:3f11:b0:ba8:a829:e64a with SMTP id
 a640c23a62f3a-ba8a82a9a1amr15950666b.23.1776667636060; Sun, 19 Apr 2026
 23:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420032701.33250-1-debjeetbanerjee48@gmail.com> <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
In-Reply-To: <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Apr 2026 09:46:39 +0300
X-Gm-Features: AQROBzDARcD5sLeznh1z-l3-bWrWKreTWgrMaYI-OYrDcqQB7Ms6YHfZhqQl0vc
Message-ID: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression
 for source pad format
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59118-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0AA24277A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 7:35=E2=80=AFAM Debjeet Banerjee
<debjeetbanerjee48@gmail.com> wrote:
>
> The CSI2 source pad format was set by blindly copying the sink pad
> format, regardless of whether the sink pad is receiving a DPCM-compressed
> mbus code. This was marked with a FIXME comment.
>
> When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
> MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
> before passing it to the ISP pipeline. Therefore the source pad must
> expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
> the compressed one.
>
> atomisp_subdev_uncompressed_code() already implements this mapping via
> the compressed_codes[] table in atomisp_subdev.c, which pairs each
> DPCM mbus code with its uncompressed counterpart. For codes that are not
> DPCM-compressed, the function returns the code unchanged, so this change
> is a no-op for all non-DPCM formats.

No, please spend your time first on learning the process. When sending
patches like this, do not rush with the new versions, keep at least
24h distance between them.

...

Also, drop the "staging:" prefix from the Subject.

--=20
With Best Regards,
Andy Shevchenko

