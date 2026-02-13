Return-Path: <linux-media+bounces-52719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPC1MKgIj2ltHQEAu9opvQ
	(envelope-from <linux-media+bounces-52719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:19:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF0135AAA
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7073304791F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB93542D7;
	Fri, 13 Feb 2026 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PelC9FNf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7659535028D
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981298; cv=none; b=RjQQjx6GOxYz6UgqiV98AS0o7N0YRZHcysnOQTvXCg1RSrCgEgoTvHt3wC6Ev+tUGyhw6Ckgj1z6b/4ETLaQy9jbQPE2QGqs8MtrmechFVHes69QwiRuwwqkp0YwJTa2VBdM96fJu0XrrNiHjpeh7z1DfNNqVk2FYq9lRXMjIy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981298; c=relaxed/simple;
	bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mMWvnAGK/G4tp0HkCVU49c9YYkQJaT+gWdAuKHORKyjrv/sICRcWJa2D9p65KzQXZd/ugMQvaEmuWzAHVSpSSWV4Tcp6IgcdYTH3hX7vjZdZSrwrBxxKyK5NvqldaPCI0O1jq61pT7u1r3ex9j1cAjNXnsdGFXcyZFdQgrkJomM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PelC9FNf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f86167d39so94155366b.0
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770981296; x=1771586096; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=PelC9FNfMKTHVBtO+wAgF8CPg5WWR1qbJd1PstJVvqLBHn8eSjUhOXaSEXoXTMZ43P
         T1bxvdxk/GXoulZcHp+sQcUCcSg15pA/i8frzb0pLP1313hhKeKa08aPq/uGPS8Stl6R
         wQN614kM1wkCzR7GQQgoh4dPZG4RpRTIrSbC23gNgYNnt2JpQ9I59KeSdmKDksWBxry5
         J8/Ztq12MGql/Ppamw9bF+s0tSpuzwzfvVyES/dsc0D0bROD5xGTw5VHq5zJ8c3o1L99
         Fkw/OCEvEEWlEi4UnoI69WZpD4tA4ENmhL7F9D5236ExpzatvwsUWautWKCkPjCHdGCg
         t4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770981296; x=1771586096;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=ntdil/9lJX4FfpLajO7Y2JxL64zA+8n2DtIA6RZnOXPc1doDR7bkDKb6cq3UsEsF9R
         qt7jLKJBdVlDo7Ci39hm3VuF5V5mAU5VuH5iBBCvnBaszkJsAFdOVoN9yd6lzVeFGucx
         uYfCiMVHeMiV85H7o6MlzyaPxHdqVOjn5nqvWB/fS/ZSJu/xBQvUT0QnAQmCDs+s4KZj
         QPiZbRr6DRbWAwUOh6eKNwgWtFHJWP42wnoj8uoIZM2Dw/UdpGzzVC/dn+ZL+EIX1Zqx
         B8TFmD85znjstKTlmsswTslrVvVUUapdwglTz7W7s1Fcpk121pwFguHGwvDDUEGklmgf
         JVrA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aaaGYkmu3NRo5y8RSvIDVNKB7lVBgLU4Efd+nxeWkuyPrLTkU5z4NnMTdleUJizEjO2WzwjW/BNZ0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7JsusP8JDXaKhhxCT4gFxb+l2RreeX9LthNYeHqrG/K1ViKi
	nmogggmnHMqVjcz3qNvM9q82AJIgOz7lE4960Z1oek/1bvKljg4JWHRv
X-Gm-Gg: AZuq6aK9wTc5fG7UCHUldcR79Q2WuyGgJ4V60ecn6ZIBJKrM3toTlZFuloGi2BOmJEN
	7DTBM35t1Of4bV6e9z/25CjwkJWdfIRxnTN+ZG9Zz8O65mwSFOXZTDcOCzUrULhzzn5mQVS35Ap
	tvY/mbDKjnNbyzS3hqEu7UfSMqYymZ1i4hj5HB/H31yIujhljr6f0bzuJw3DFykBoNeWyutOxmr
	YHASaRAQVbBf6l1RMSXPBffAabF5YwieDKPC35wVSRBqM9krOVW46S3kXnkJ22MYdhmGoNG0omb
	2vh7SedG3/N+azdiaqM9S0V3znPek8QGFS34vzTU3k+HgKZbPDqSElKLNxPlxkjISMZm+Zq69sJ
	HpON42SfcywL9JupzDCECY4kv7czt+E0tCp/J7Le4OLj87iJ0j2E5D4TNb9APF5yHCHP5d8Cxew
	JZQgnB0vtnpsUu3S9ShupOwQcJasgCgL7K4P0u4YLU+6iPTo/IXqHjIzbvW+wZTLnKw9rjs/Qgr
	ikg
X-Received: by 2002:a17:907:9715:b0:b84:2b70:98ec with SMTP id a640c23a62f3a-b8fb44d62efmr75438766b.42.1770981295511;
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fbe407520sm3908666b.43.2026.02.13.03.14.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
Date: Fri, 13 Feb 2026 12:14:43 +0100
Cc: Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D93350ED-72E3-43B5-BA4F-42E0FE491B2A@gmail.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52719-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amlogic.com,kernel.org,linaro.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E8FF0135AAA
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Krzysztof Kozlowski =
<krzk@kernel.org> w dniu 13 lut 2026, o godz. 09:55:
>=20
> On 13/02/2026 09:31, Zhentao Guo wrote:
>>>>>>=20
>>>>> Why? What for?
>>>>>=20
>>>>> What is canvas provider?
>>>> The canvas provider is: drivers/soc/amlogic/meson-canvas.c
>>> What is this "canvas" device.
>> You can think of canvas as the agent through which the decoder =
hardware=20
>> accesses DDR.
>=20
> AGAIN:
>=20
> What is the canvas device. Describe or point me to bindings describing
> it. Your current bindings say that canvas is "a collection of metadata
> that describes a pixel buffer" so there is no way it handles DDR =
access.
>=20
> NAK
>=20
>>>> In short, canvas is a hardware IP inside the Amlogic SoC. The =
decoder IP
>>>> needs to access DDR through canvas IP, so we need to reference the
>>> Why decoder cannot access DDR directly?
>> The internal topology of the S4 chip is designed this way, we don't =
know=20
>> why our VLSI colleauges designed like this. But similar designs have=20=

>> been removed in subsequent chips, eliminating the need to rely on a=20=

>> common hardware IP.
>=20
> Quite poor explanation. Based on this, this as well could be entry in
> device reg lists.
>=20
> Anyway, I am done guessing, explain properly the hardware instead of
> answering with half-baked responses just so I will go away.
>=20
>=20
> Best regards,
> Krzysztof
>=20

Krzysztof,

May you pls explain me: what added value - to upstreaming aml video =
decoder - will be provided by giving NAK .... because canvas/DDR access =
details explanations are not enough detailed FOR YOU?



