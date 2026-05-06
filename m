Return-Path: <linux-media+bounces-60679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLokDo2L+2mWcQMAu9opvQ
	(envelope-from <linux-media+bounces-60679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:42:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C024DF786
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644AD3011586
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F0A4C040D;
	Wed,  6 May 2026 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJDHtfa6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F000F318EC4
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092907; cv=pass; b=EqCRTPkWsXp2/slsM3IpadNNL10yQSyagS55u8rsWwKqn+3Z8sWEPCwhRIpFNWnLUMDQCKOlrxmh5FA65/fTRxMg9dgJLmQsCWqGimFCWvBavgAED+WbpP6wuN7Xu2Nav7YbQUOjgFHD/1hH8S4NOMVj+li+nT2gMd4/RdmWo6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092907; c=relaxed/simple;
	bh=j9OzMDCUx++xg1QXmB23Fwoo1yepjodBYzCvOs07Zjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUSPoza5c7ujkIx4ZTyruaaJ6gf/6rb2VN3Im/F9wLiERdkCSUUf0xFefrQBBcldioWOr44KUWYkbpV58/ChxOE/vgx4c5n+L1K+/ZhNATAjIgVN87A2cZ6FOIyR+cdoPWL5uOn+YAgZmfVKcHGQeHEU54bUOHups6iUv7VLYck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJDHtfa6; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12e332315a8so141722c88.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778092905; cv=none;
        d=google.com; s=arc-20240605;
        b=PLfaNjO9XTLHpMbsqnpOlR3Dev3JzFCw753sMrFmbY5uY6HXsgkWjumznNhcwBrXfU
         D11upaW4UqD6/rFHpuCWAHpSQaPqrNJMKP89cneTOWniR+uy7N4FGeIIg0N7cVd0BSYW
         hzGaaPt3JqIkZcG3b9Miz11fuVwW8Nm2FObTGoJC1olKWv3QVxKhhBvyvlvTiD739Uio
         EIYvsosLQU7fZbWni3YkLwbyhauCz2WVxhjz2qEGTFsLjZX1tpFd25L1haaAcwd5wvqi
         OireUlSw90GfeqKpnxkURFhNrp5yAOTyO5b3zqARJdNErvMIjcCHw8Bp+QcsQfor7KlV
         AY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        fh=bYv+NfbmzQlR8G9Uqieqkz89JZ13hbqixLpsx0iLL54=;
        b=NyY7WflcpCaX/Ef4R9+tsNlEl1bQma3oJcG8amf1Hb7tbaAvzL42fa9Rr8EjaN2V71
         PRHbXN/UPCVsf7uzgiAcOnghP1z+GPFWHjr2juPwgkfaJC8D0qAZEbYHR8MnKjXQ3PkG
         FEiXj8B5h0szMHeDquCvkNd4jrRzicMaq8YxFU0ZrC7l5bTyxIUqgAXMp23cTxp7vhNG
         xrOHjKRlmc1elDJqrHvIavSUh+r3+o4uMOhA4Y/jWCz8dKHiw+ouBym7xNMN7LHu8Qjd
         38yJ8xL7KxW64IP6aowP4idZc77uUJk/4+DmAPnmg38j1QO5M9ciPpbkDboMcw0jPzzr
         xQIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778092905; x=1778697705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        b=DJDHtfa68Pt3KoKChlwp16FeItOwx4RRItk9f0y/ouX0SwbQSVAT52uI41Zmo1dZx4
         6EwXkm/NhyX7jx50TCZOS/DOSzbIjcOj2qwcLOBblJZ4si8cO24agwP94s8arDRXU+wK
         uRCyGG9l+QPqE2Lk/KiRr1FjeQZqoka2AIaEUgR9tfjm9e4q9uCSYefptRrL+9+Hrn8o
         y0Npfvb4x6piUTlm9NpBm2YYgeeZS96hwFDtZRHEy+2Pm+ZzKrOnm1tCU9nwsC7biFao
         nsgbySPzCZVqlDnLc1zKmYO27NSqdg86nfdmjxvrZVNRZ6OrN25wp3EX3ZKWQe5zSCJT
         dgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092905; x=1778697705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        b=hlQirA482bIthkLCGQ00PKTnK3n21Ltqpiz/y3sX7YdNBfZNdZf7wXppxlIrgdObRw
         glgKpt8HjI8ctSuKIg/h1KHV5EFuljHvXuz5h+Zk1w8mJTGvwVV69MPQ4IpkLogK0iJ1
         E4y0I1YvvHOFAEBYU4O/AIrf3Yk+v/qdVMPXtqJ7olt47bHEhNQj+gxaoYOyy8fqnjBY
         tD6C02DdbZx5v3BJ9aJP73AbdBFzDcs/gPdKn/U968Hq70eNUf8+HsoOODHBqvAvWAD9
         ExNrjQp1JpALqjeoYyuI7Ej0PqR5jELlsE0HpgaSXxdwNSSAKjha4ihg9OK2UmekmF6t
         5Yrg==
X-Gm-Message-State: AOJu0YwUGIAFfkE0fiopdaQ+31vijjTZw1yDlpJnOXh2nlb/QOksMFpc
	wFteFbS9fcFL1vP5BwlpSOnyvECweO14FisaKTNl92GIRYn3zXOybFFeoKTdfhEXLqQXzioBtSa
	LW5POW3zEg1ilpygSQ53bfcYzboM1l7M=
X-Gm-Gg: AeBDiesXXDM0a4guK3Msq9MRybCNLXBkHxE4EeQu7UPc9HUGEFciX5SUzlfnkylJzUM
	fi4DRbv8/BLmkFhqYUoddRAPt5Pr0veBeLewI80P95fyoVvokxhpqK0RgDEX5nNPR/2+JiYIFbw
	heg/QkcItXQsBJWwbt3f8iFLtl0x37Hn/G2e3EM8B0rqbV4wjtYgtkcdhAwq0kaMweEA+KKr8wc
	73oAqM78HpFV2ibyqElv3LyBTxDudgh26a4OI5c9qv8SCP2gCH+vDOLg1QyWi9sKMZ7fP4Mp8RW
	998+qEJHg3X/yKseDnsPaiOusNu6rA==
X-Received: by 2002:a05:7022:221a:b0:119:e56b:958a with SMTP id
 a92af1059eb24-131851d7c2bmr2311809c88.15.1778092904822; Wed, 06 May 2026
 11:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <20260505161135.GD1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505161135.GD1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 6 May 2026 21:41:33 +0300
X-Gm-Features: AVHnY4IaKXsHbk6X_FKurVf7JbuwUL8sg4j16TevJVgFZMvXnzm3gIMlSMMnh9A
Message-ID: <CAP1tNvRTktNJXDs74ntnS44KWOA6h00ZRrNi6jqRwe_=zifzPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C0C024DF786
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60679-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello Laurent.

> Thank you for the patch.
> On Fri, Mar 06, 2026 at 01:36:14PM +0300, Alexander Shiyan wrote:
> > Add driver for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
...
> > +#define AR0234_NATIVE_WIDTH                          (1940U)
> > +#define AR0234_NATIVE_HEIGHT                         (1220U)
> > +#define AR0234_PIXEL_ARRAY_LEFT                              (8U)
> > +#define AR0234_PIXEL_ARRAY_TOP                               (8U)
> > +#define AR0234_PIXEL_ARRAY_WIDTH                     (1920U)
> > +#define AR0234_PIXEL_ARRAY_HEIGHT                    (1200U)
> > +#define AR0234_MIN_CROP_WIDTH                                (4U)
> > +#define AR0234_MIN_CROP_HEIGHT                               (2U)
> > +#define AR0234_CROP_WIDTH_STEP                               (4U)
> > +#define AR0234_CROP_HEIGHT_STEP                              (2U)
>
> Where do those two step values come from ?

The sensor=E2=80=99s line length register (LINE_LENGTH_PCK) is calculated a=
s:
line_length_pck =3D (crop->width / 4) + hblank
The width is divided by 4 because the sensor outputs 4 pixels per pixel clo=
ck.
The step of 4 ensures a smooth, glitch=E2=80=91free horizontal blanking ran=
ge that
always aligns with the sensor=E2=80=99s internal datapath.

AR0234_CROP_HEIGHT_STEP: The sensor currently does not impose a strict
multiple=E2=80=91of=E2=80=912 requirement on the height in normal mode. The=
 step of 2 is a
forward=E2=80=91looking choice, intended to simplify adding row binning sup=
port later.
When row binning is enabled, the datasheet (AND9812=E2=80=91D, register REA=
D_MODE)
states that y_addr_start must be even. Using a step of 2 now avoids
future ABI changes.

Thanks!

