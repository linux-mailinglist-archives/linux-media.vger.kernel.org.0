Return-Path: <linux-media+bounces-66602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id af0oJqBfSWpt0wAAu9opvQ
	(envelope-from <linux-media+bounces-66602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:31:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2EC7083FC
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:31:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WWNbUg50;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66602-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66602-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64453028B5C
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 19:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1471DDC35;
	Sat,  4 Jul 2026 19:31:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A2433E93
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 19:31:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783193488; cv=pass; b=G1FjqmlMkUFbRJqUu2EplqOJzbHf6d/iV0Yc8dyW0CbO2PsEX6qk957Kj/dDOll+VkyRSZxk8VBEyQDOFb1ExO3gKQ1dw1cEmrblIWZTQdPrUMQwDAR0ovg2+ZcyvKxJhu4YnxDHTeSaHfL/0P5L5Kf4DBCLDJh67K8PRx19hls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783193488; c=relaxed/simple;
	bh=8G4EPkT3eAJkamJxrC6wiszSymxPHgPHa3qEVuPfuyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYOhSYGo0kTVulLtT8PQ/R4SGfHKeqzMXUE+1TZJnpzESpo0HICAIrl0lCt9dIDHgFTN1as5NS/jI74bKm5CzAJm1SF1z7i5XxbuXxfJelkvSZJYNIhMrSPuu7T5g54CsKOFaB50TazlFfHOZKUSqOtIiDyWc0pv2fgDHWYGlkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWNbUg50; arc=pass smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso3259632a12.0
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 12:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783193485; cv=none;
        d=google.com; s=arc-20260327;
        b=AY7kHIGnOdC1QZ+joAlng8kyJsbWJCrspyy62Q6gn4vdHAy9PPIV/cZQe8jk/QqTlA
         4kvhAmhLicEj+R/C5XQSH5k1kUE+JDc3M4+RfKO41In/go7ZrYzsY57Y8a5yqxvgD3do
         rmVqKsUx1ciSRDsKYy8XB6Dz324CkUDHEGZS4/xuc1w4y+rckEX4baxe3FncCnWXgpdH
         SpMVnz6XoZwlBsJB3NN3rZIxPueYZzduYO+61DdM8mxum3saiPOWlQddcBRTCxPa5Rsd
         9xPhXANZA1iH3XAAqhzZ7izFFMqjRmeKVnAg1gEoM9UJ9gdTjz7zwV097MQ4d/cyZfBz
         7XGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8G4EPkT3eAJkamJxrC6wiszSymxPHgPHa3qEVuPfuyE=;
        fh=Bju5bXYEuXl4i0R4H74WSwxu8OrFNTlCoc9rrq7d2GY=;
        b=W9yJ3inRAMaffJDXSA/02xZk/ULZz3Wsi1x2eiYIJewGXhIg79rytwGUrXHe2K6Kgi
         iKYGdiXU3ShyYcwGkqzBcxNkf+e8XzGCU+kRDwL5yjWvrpKyqizC4gTlTd+L+md8Q4mA
         RYByh9HQBndm96BgD/u6Gn0I0bWWp3muwr6YOxR0NAgI3ob0JcnNZYGxLDC0sq4WIt5V
         lvOHJeNrg6sweGzfJNjGuzw0raMDYNcSDhePofAZIWlbKQ1GkCBFdVl9aeTBtyDk3AB8
         mwVa3JE78aRfdKhMZmzw9Gb3W97OLqtGu2REW2GeSIvlTFy1Zzj7HUm6UMebm9UaeEFS
         KVsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783193485; x=1783798285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G4EPkT3eAJkamJxrC6wiszSymxPHgPHa3qEVuPfuyE=;
        b=WWNbUg50UMrvpJlenJqHyll4tvDJwqrzWbi+t3I6761ZEyMkU4PAx5gZhh2dqav5Q9
         6SuwOOvZvAkjrLHQkSJFhjZt5dvp7bz3XOgRxGXwhcKJCOJ8Z7bbPcL5rwW5yHuJc0Gt
         LyRSzqNTMnDZ4ItQvHy52n5K3aP8iuAebyayDqgsT8tio52HetC1QtnKb1fcrHHK96+Q
         ruzUJtRIgIO/rs9vsLxu7ktU54tWM9jhNuPOe6jPSyE6zsp+GO5A1/Z4arCYxQiWjicn
         olKkmEhmzE1ZZovam2EJ4sRDowiIZHHjnUyo7uSLAlWgzF1wRQnY/gVzw/DG8cECndAD
         yI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783193485; x=1783798285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8G4EPkT3eAJkamJxrC6wiszSymxPHgPHa3qEVuPfuyE=;
        b=m5JjfndmaWYz5rfCnpdst5VRVe+/1JP6TOS33VcH2KrYgbEuI87X6T0lc/P6eBt1qc
         2vihSLQlSiV3NX7TSQpdd7wjrFTaqOtIGXhJ7f0Qk3Z84ki+P2Mf2zeMa+LQ3o0iVnIZ
         z0VNUZPzaN2JTPZ4nalC6Eodu/EW/r0PYCUABt586mV6KuhG7j9VzGvO6Wf4GWcJsVj2
         QmetZ25tyEol1dk7yMEOdLH2rQDONN2nePMq3F3r/H6sk+aP8pFzj384OFBHhNQjOW4u
         ydWVyXAph9F7IWkiMrr7TJAudZEYDj7G9NeSk33F8d18bAlOwfX1YGeC47slE4TaLlsy
         hQ1A==
X-Forwarded-Encrypted: i=1; AHgh+RoFkH7pbBImgOTtU47POkrjJokzWM828pVKB8OaksCJPHw4eZ8MO808qqH7N1BPDnWdkSUDZZKFw1DFFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEGx2+1OXggOPA4UmP/Or5YW+i6aQaWQITk3x41FH1wWNO+Pa
	pQyrnmIjVcqCPeOPyjfomRBDff4DQJ49+MMw5t/+LuvoUbjKWS7eDHMjwkSlQbJQtzHSmCZHXQc
	KshjIcaiIqbY7o+VkufbKexya6wRqWQo=
X-Gm-Gg: AfdE7cmN0ZvYt3/L+S+0ltlDSf76bkJtntRmn9LXRQLH//DbzZIbBImRrz4F9w007zf
	FPyzdAt1J5NbNnaaNtqny4gB4vYfv6XDb10B4YP/iHEgLjohmQw+NuLi9RT8mlK/Xkv/Le0LeZG
	xdAhawocB02D7y2+lH0fut2WR2ZCg6gBtl7UibNMj/mQZUl87kHgivAbt/o8DJehtDnEvwDUTTJ
	dwKIK2hdGri6aKrRVAdyBQYHBpkLJ5qaqW+c0Z6rpS9fcJ+OrpzZ4inx2S3PR+qoViZEnZDnzKN
	fx4sizbphTv/cSMU06k9TU+JuakOYpIi9mUo0m4jdD0NFoFIU8RJqrdVJ2SJdfw=
X-Received: by 2002:a05:6402:43c6:b0:699:ed7e:3574 with SMTP id
 4fb4d7f45d1cf-69a1a3a96a4mr1280353a12.20.1783193484827; Sat, 04 Jul 2026
 12:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
 <20260702-hm1092-driver-v3-2-85faa7ff4fec@gmail.com> <akkRRCaZMRyoWDt7@kekkonen.localdomain>
In-Reply-To: <akkRRCaZMRyoWDt7@kekkonen.localdomain>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 5 Jul 2026 01:01:13 +0530
X-Gm-Features: AVVi8CdWv2JAgTV3G_0dGXxhg8qGn0uOvvqxZ0YpRlHZfbYpTrCeb0JnfmFpVgQ
Message-ID: <CAJTcUFQ3CJQhEv_N7L22FmQSJsGpfMvKO1F5wiEarNca5VmV5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	INTRODUCTION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66602-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA2EC7083FC

Hi Sakari,

Small correction: my name is Ramshouriesh. You can address me as Ram.

Thanks for the review. I=E2=80=99ll address the comments in the next revisi=
on.

However regarding the mode names, there is no proper datasheet for
this sensor released publicly.
I will add the proper mode names based on what the camera does in each mode=
.

And regarding the driver supporting single data lane, I will make
data-lanes optional and
will initialize the endpoint parser with a default of one data lane
and configurations
explicitly specifying anything other than one lane will be rejected.
The binding will retain an optional constraint permitting only <1>, so
an explicit invalid
value will be caught by schema validation, but data-lanes will be
omitted from the example.

Regards,
Ramshouriesh R

