Return-Path: <linux-media+bounces-66723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JOziFNR+S2poSQEAu9opvQ
	(envelope-from <linux-media+bounces-66723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:09:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567270EEC9
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:09:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JZRz0s7l;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66723-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66723-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42B49302E863
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 10:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462D343148E;
	Mon,  6 Jul 2026 09:51:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637FF423798
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 09:51:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331479; cv=pass; b=hAHygb1eMZE6WZhaKP6AbSqoOZRlo+JvwoCqDnrUqEdZDUSssvJzEsnTvH2yF/1fS+WPSZMolrzoLnJjCdCibiGcm3ykkrJKQT5GrRAoM4dGXR8DO7MEFyByGE5QUCWBGHYsgpbut2bOUVYyPGljDE4sSvwyyY52sOYu4v+co70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331479; c=relaxed/simple;
	bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULwccUyodNbFELlbsIY1B2e2CBeLQJaU67Uiu4iUAKYXD0gMVXxENyNEMkAvcwn0jK0pySSSVQitXBfc74BYDu0gP8P9+pqwxstLfViXA4dJcwsJzhG6WWL9P60RYA0Fl2zw29SEzjNIVM9EcT55CymxI+wmJe0A780kIBfp6iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZRz0s7l; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698c0ff45b5so5058046a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 02:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783331470; cv=none;
        d=google.com; s=arc-20260327;
        b=NQHeYRQt8dsaXolwHJOVkrmLuvLpCORE+CT/J4u8cmxkp4ZKym2VwFYFdPWri53uQT
         Fd0hxTNr2n/8OmeBWamtqMHQ/PU+zza/JB265LTS2yNG7b8GSCUQbKgVItVi6U4rW4Dh
         hHwdbz6U8ONp/ii45FcPIO/oBWyDEMPZKSFv+fZvrwjke/Zox4vlzMXEFDSySvV8U0hF
         BKTkxyN2v9QeCwLeM0EOOYRwEfrxhjjIfAZT7q5BGwett6ZOTOwPmYKKMWCb65mizKj8
         ZGv8DVWdgdrdNJbc97u0OyGuzcq3RTu38jF7F+HCVXTQOhVNjcbzawYweBzTuMUmBkHs
         mwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        fh=RDmBTNG0zaTCnsA7Z78n4iZ4VLLhC1wzTFvJ+3coKxM=;
        b=sPzCJ3EakjM0WDPkx+6jClLO1DpTTU36q40VoC8NIJzGkiJl9dTpT8ZwHiejVXdJI7
         Y8ZHaT/Ewh6hGoIT4mV8QCqplwiif5PhujkVHuyZ8w7QeW1wuPXLVwtIad+0pshUG6mI
         0ixTUKL1e3FSr6PbwrVoUTPjI0xSZGVcWcozeSKDUHKPDRLJi0u4cfcL/iqfCsNwXKR1
         Kx2Nd6FfCBhJzwdhp/6jm7CvXekn/yAeT9EXF3Y5GIJP1rhENLe1UrFlrHbhuBHwO+Ic
         IsZrW+6pdalzccZdPbHyVqL+QvDa7X9QuilYOy+gkJxiAe2vbNMSugb2xxyG4dz7vK9Z
         IdLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331470; x=1783936270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        b=JZRz0s7lUkUJs3eW6bL80/ida0PDnKwzPUzXGVX3ELYV0EouAP28sTE6MzeBEEYT2Y
         sOkqrjg4yceYQsnRocj6BDTzO5PSlzI4xZXCokGQz4fNi4pr9oGMHKFfdTrleNMiYmcc
         FB2Gzz/uWe8bKjxzrH6Av9iMg85YJV349Gf9LURtN57h+M1U7Atg2kbU0EbAjEIgfRS+
         3bfft1fYqnOTl3KlG/1EeFbxHTiW72LTvAyJ/H0LORk2ag7rgZQ6QPJPwRewh+06RPqf
         HLOyapRAleTtnzKf0l8/cV3RAHmsF9odB5RRHlmWx4EtIEe9NsuML9m0UpEGZ9lFu6l4
         fIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331470; x=1783936270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        b=FLmq6HfriFUESaw/h9Uu1jrAUAOaQ49A5hmttPvBhDr5Smj3P8RbZ+XaobLtD0Jg0Z
         wngQ/o+4jVRcMzqKkhO8Jia+ZusWfzgULO2LsfCgSL9/TCFObFJw4dg+rhfVQ5Q0F98k
         YZeEcAFQADl8+ZGi5t488GREgtRehwYPMdZe2fz/2gnK02ys8qxqQcijBVly/3itH6/t
         cF0TkumaXZcGB/J6OujIXnWcbkHTiK5usRjqVxWM/rGWdWRB36rjGIEsPNLAdTvDxitw
         MrOosGYFPlcUkq82CfLanvmCDC1cNFQiP+NnG/ggc/FXBeirZms1LuAbEQ9ddAcmcu4f
         wQow==
X-Forwarded-Encrypted: i=1; AHgh+RqHkPb5bMXLtul2prIfjYAQ6RcrfKcv3w2zRZMsh9JYOUwoUWkJnQQjgGbFOjWZkVH3XMhR7vrZj6twdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq7REpEqPyvjkscD9d3cseboslwT06nT6zC3IyzfzyKqiweeVp
	kpAds7xyNeOGah2lkZN5BVynz/nyzQa/bYrrsvHuCoVO8jS3Ai1vnzXR44GTL8lBSKyqQrZQr6Q
	wv5p9gkaGXRu7Q8/YHZC8V+MAno0mVgCmHRSBtRE=
X-Gm-Gg: AfdE7cm4b8GoZeskNQUhkoYJODcZn1QS+bV2X90fMax4QIk/Ke//sDIvnYin/ljaysI
	UBI+AEUSwiDIyRMLUn2+GsTZ3NzdK1kSCUYixg8p26cHF4hor/Gb3RGuZHCv+Wkwzkhwpz7WJhb
	HDsom0QHhNKlZl6SFYqzSepTQJ3Sm+x9JgFOiVxWJmpva4vqhTIUwi9D29IE/7IAq1yPOTsFU81
	nRXRva7FxaV02Uo16p6g/+shCv44J7FxigGBXx0R7G8z+56xTCvnpBDECxTr63ZCaWZcZBxBXdx
	1Fu5nsBY9SNUENXChgVclNEW1Vyv17m02ua9Zb/Rl8oPz7tpHX5v8isnrZqpRqxNwbb4q/oX
X-Received: by 2002:a17:907:8d8d:b0:c10:10c9:6d8c with SMTP id
 a640c23a62f3a-c12c9ef80ecmr561127066b.28.1783331470033; Mon, 06 Jul 2026
 02:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
 <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com> <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
In-Reply-To: <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 15:28:59 +0530
X-Gm-Features: AVVi8Ce7iwUyrsEwHvTqrYdzrnQMNe8BuEwAuAp8a-21GaLZ75nonaPy1ao2znA
Message-ID: <CAHxc4bsSmMeagAK=Wrzu2DCCaxt2xCgKXoJcAS_xgKFAn9LmbA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66723-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dileepsankhlads@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4567270EEC9

On Mon, Jul 6, 2026 at 2:55=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> I see, but please consider that to have in the future. The driver has
> tons of work needed to be done, but most of that needs real testing on
> a real HW.

Sure, I will try.

--
Best Regards,
Dileep Sankhla

