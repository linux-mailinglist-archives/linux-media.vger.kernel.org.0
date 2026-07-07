Return-Path: <linux-media+bounces-66902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jt5XH6RVTWocygEAu9opvQ
	(envelope-from <linux-media+bounces-66902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 21:38:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3071F4BE
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 21:38:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=googlemail.com header.s=20251104 header.b=bK4v0W6w;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66902-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66902-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 042A53022FBA
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 19:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DAF3A4F34;
	Tue,  7 Jul 2026 19:34:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20107374A0C
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 19:33:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452840; cv=pass; b=D1IwWLz+VSdSb9/R00I79Fq497hGLu6sa2mXq0lWbaCYPMzWQyg8q7cBJBEk6GAu02mb5KR1iga/acYYk/Joig7UiNo8gdqLQmjKCmFKBPgQspP22tWUHnvoAiAJ1kfFDDeI7nptgkW8hq6Dl16A0fjRaKef8sYwj84z2NlLe5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452840; c=relaxed/simple;
	bh=VEGGv1a/IFZ3v0HtmfoFwrukcxyKwWkD5BqkFnPRmn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGC0IjSYB8/Np5yZTTomAqyubRfUMEdCeWG5MXbbhH5jHAJ2ZT3ZtevQ6VXdhjkPo71Ef0wpCd7mOgIrAKMyAjqusZCveFVSmVmh+12QazgxP0uvgkcpb1Nmg4gsfRvTY4GLs9qGlRC+HI1VC1tHqfhLghVW7T4HKDRJhVfAPe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=bK4v0W6w; arc=pass smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so44168675ad.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 12:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452838; cv=none;
        d=google.com; s=arc-20260327;
        b=p2cbsx3WpulcCBWi0VLekJWYHNenWFC15GzTBhfvHxMoSa4EFmmGJZzpsO9JTwkjhb
         C6O4p92W8UH3mjXHFREZd96TNvh25ka2zBrcc3Lj4yeNtxWwIKnBOpgxeg8sRzwkJFzV
         MwnpSshT14fUEJVuQ0yFuDXMxB/LYn45oWerhRS9efMSLgiJmez5hjpjWjWq+JjkGIgk
         +puoGlTxySs/XBfYE2OyhT5ZKFZudfg7DH58Dgv57V51FIsIH5sND/wqliNXsRi6GA5r
         9ivNe4k6om4V8uqaqPcJgM7aeStWjD8frC9LgnPf5ReVZHlQEHxIQve5P+lxbi1T9Qwa
         vXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        fh=01DFr9FMySfxPBd7UQD4CywqpaQrqwyB2x5Rsekqkrk=;
        b=CxfXphjufS4JKmzoYO0akVDRv957XlDAFr6XEAcaOkI/S1xhWhc8Jc8Urv1t6Dy5RZ
         5DDhiM394BsP/38yZqipRZtKA9W6jyKuZTvHcGM9A3CUL0enuCPonyfQuySVoClMnHfb
         uotx/DawCRkvQQsGkI1/B7VxQHxAf5UzXIQYZCI710Q4plc1EnhDV6SjQPbnYtB0sqxb
         OxPNaH3SIj0oCk0vNu6AlJFSuX+9l4x688TeCQNSJAY+um+/x+qzqOm9raLSkD4+cIm9
         0CTePQpV90JFngARpLaZoqtvkguAZFknxu123qrgIXCatKeP2sbvU9PJPtHOs79F8eIV
         eUOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452838; x=1784057638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=bK4v0W6wn8axhcvwCIwZuOaOR6+1MrE82oPC/i8wygeCnkkMfPA47ltdO4cDQ9dlAw
         I14gA0KyQVAdX7xaDM8V8Y2zolvzE2uATF9l4ceK+HF/5OVkqrFFOM5ytXs87bqdyMDD
         laNGHDDPQZdkalBbTw4Fbatrt7xPHC5zmuJ4yFVivL+rQZGJXZ4+lu0+PupMWDt61JJD
         l4tsEkoonJ8KaTVerOCJhZeTLlMVxVkPnvZuouuTBflruQDq0mS49qYfVW33YxvtUF9r
         91Wnj3Iv79tm/De9vL0ID1sJT0v+xnwvc2s4jsI8m8XfRw/RDZisVdwgbJwuOlePhL2H
         qLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452838; x=1784057638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyozU/vDPu2HCP79K3EvyVa5mFVfDBDWP++SpDgv144=;
        b=XE8b4/kr3dci2gtbkpZ1qCP5wrYhLhGp1ndzvI64FNL4ES+IMthJW2+TEF+DzEwjSC
         Uw7rTRQ1pIF1FjQLCoDksygVk3XU/HZHAVwq8aACYEpb4MxHWq5OKgNlktJF32xIoXqZ
         WsD6vFjVLP9snu7gelEr7nZYb09ezZMRd5pUGmT7FEOE/5cSblzxtjUv+mmIEU1ik0vE
         QwpxCdntzb+cVpEcBKXdzlvMJBi7p7SRGi2K0K4ASnhAU7ukTupM7qZQy8tpPu1KnkyK
         IEAu1DsjIC17uenCkJixJEut0xWbYJa3dXgutZH+1VszabJ268Bsl0d62qah1ZlcFmHC
         mwPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+50Xy3ATk/29fiOEawdXNlEzie1ZpLZFAUsMa3FInOcg9xinjVHNMRk/3MA79HZgvzcgVRay1wP1Zbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4/8yVKVz7sJk2mgZuAlipyF+WdthYkwV+dv9P+85Ea5hICHx
	s77eE7yYr3hvG7smZtXmea5hOCaS7eypCS6TQAAkt8XxFvGvRhPNgbwlpkISSWeUJKZapsEcg5I
	ggMAqETRiF4k7FErXHkdO1g1mwnxtooc=
X-Gm-Gg: AfdE7cki8FUJTU+4YZsWvQY9TGHLMeD+zVvGPLkswJQ02bjXbw7mnheVmdhnjbGVtg9
	C0oWVXdQXZxW+gX5E1piZtU+Zr6Jy4STRDiX6uK10GZQOMCajG4+ilTcZKzD8Yufiv2TQr8pnN+
	eVtIIbUFbYtaYxaVyQ8GzjjQhov50i5ZjQNA68lEly5wtUv7qCB5QWad8wJranlqeDj7hKKdqom
	RNED0sFs4ADqiqe2HjUCBpYeshZs3sHlcmmRNfDIxEKX1+NGO0qFik8P/fNMuR5BrGVPpMi1zRT
	E+e0Lh4dIkRZxcUc4AISjRE0RvN5onq1cNyl
X-Received: by 2002:a17:902:e88f:b0:2cc:307c:51fc with SMTP id
 d9443c01a7336-2ccbe722438mr59133075ad.21.1783452834318; Tue, 07 Jul 2026
 12:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:33:42 +0200
X-Gm-Features: AVVi8CclFQkx9s_G2Hys9qfZAMuAY5MfDBKVgSfmmojs2V4cbQk8rdJWoP8wXjg
Message-ID: <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: xianwei.zhao@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xianwei.zhao@amlogic.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66902-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[googlemail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,googlemail.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5E3071F4BE

Hi Xianwei Zhao,

On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +                               func-ir-in {
> +                                       remote_pins: group-remote-pins {
Can we keep the established naming:
$ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
37

I'm worried that adding IR blaster/output support at some point will
then lead to confusion.


Best regards,
Martin

