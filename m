Return-Path: <linux-media+bounces-57500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GX/NG/vyGn4sQUAu9opvQ
	(envelope-from <linux-media+bounces-57500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 11:22:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37343351586
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 11:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 704E93029E67
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8BE2F83B7;
	Sun, 29 Mar 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOXjoX43"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D552E173D
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776118; cv=none; b=Y1rqGkyhmgyzdW9vvRhVHxeK7uVHCLTIkTVTJBUQsSKGjf9EhorB3oB6rK2ZK+Ry7ROO7jgZbMd5eIi62zsR5nnz23Z56JIMgj5/2fa02o+Y20bmWSUY/WmRLbt84/s/5XPqFiPBI5HAql8RH2oXTAiDgY5EH4pk0MWmXfzQmdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776118; c=relaxed/simple;
	bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enG9A0Vbj208ETWjQ6ODv08i7p/kxoSvZocya/cwmb4jUmMVYM5UdZY9ceIe8LztrcPHawxbpVgexzcOWg+IiIso7neKbBld+L1QShFqtP7SbLVxZ4h/wcwHTqD/4KSJWJenrMCL/TIXaWmAPmi7WX8MqXODl7FuLl1PHZvtcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOXjoX43; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd96354aso61584f8f.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774776116; x=1775380916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=gOXjoX433aihGOHXsh6agOxKyUwkeI/08tiC2/AjUiGVcKYv3X2kgutUeGmJXjL4Ay
         dBJdT9EglSY2nEdwQNmIwKhr86tkou0tiwY7sFCR/p8ac6URFfnSxZTuKHd+nD5jIf0Q
         lRVoAqhvJWhe3y+g/oUXlSMjdrkDGRgnI3y0bvkBQbdwDZOn6//T9HffMFbnj7hbt4iZ
         cKVWk20LAkI5cccJwvorOIK8mPR87wAj/vUhxQVw4D8pQOxBwvpm0xy43nV6CzwRr5r1
         KYTLJIXlthfbUXjTFnuTz8P/zWAXnSg92rcpdaHJPZal7s1xPyT/Vn4PCtIL9zw8fty6
         nlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776116; x=1775380916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=jYh4YkP4+8F1fLpg2xyvX3MKT6900egcJTkY9TlGplCxiFZFKBc2DrZcitGdb0hSKs
         vuFnTMDfjqzQSiTmuUZCCmHP9akYY+YIU7xy3WHxmYRNAA/d1MNG8Om/ksnH/CfyWxsH
         5cEt+Opc1QaYOZOsegK7qVvbPBuAD/9Nxhl2vsEGNi6MEKYXrXDmn3qwWsLDTM+GNLKZ
         Ha2YC1nEKEd1C/h8tuOfGnSfAb7kebcxgoks9Jny3AAl5FhkD8xs8Pf71PfCqBZLBTFb
         IzcVitfh9Z6Utt+2bBlJlMzgvAAcyrwZNtnePdDX4Zw2mMeZAQMmCVVyYekVHhJthTuG
         E6RA==
X-Forwarded-Encrypted: i=1; AJvYcCVlOntkEpsj1bNtfFsCuHnNSB5q8jUlfJJ3dBg5ZBz2odW0CPGRx+CZxkAhsApGR+vDfhjAp+tebtajgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2nyx6cwnxGTx6fgUg9pn0j4U/JDWjCe5nGYEah6yl387xAhC
	zmfu1omXbLeFagRDWtjQVq0sfKOaOg6VQQN4Jx9pYJ6VFrzmN1l2OZWJ
X-Gm-Gg: ATEYQzwVaJ7JazJBwT8xnfd3hMmgy+xbu4PXA2JyID6dMFNJFXry96vLNj+BK0VYHSP
	75AfBCO676YrB6H66nFSvR6GKjAOTFda4V9zVFBarwgT+xPhrFcEGlmQxWQI4tknEUM9iiWWEnS
	N6gECPhszuXMBIlpOzRW6N1mrQovWEVomP3KVIP+QE2zyVhXqOfPTkxxY9fgbkXxNiNu9Sga+2l
	ucg0nhrKZcLHfDiVRmSr7LNmHIvFP3gdNok8TG+UzhlqKTkCMhHYo4Nit9WMXgFD8JDFythn3G8
	gmOnE8ct1nnd3p8PRm8ulkQmBuPxkaN4Rnf3tgVmjdK86U8Tbd4ORpMHlb4eCMswfic/60bi4jW
	/Fyc9hg8tTPMQRTbrA4zpWMuA7+uR6AdQMbmimVD0OdZLgoFWgqKrHtAq23EPe46hrrxUyTpzWG
	QRkefmM157FlR4/+FgK58/W2LFPPsOexX8NTxkpSegt8ztfmz9JwjClRshxn6IyQksgBZNAHohc
	fjWXLGLN27bQvIiyg==
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr14838629f8f.28.1774776115668;
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm9945848f8f.9.2026.03.29.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, nicolas.dufresne@collabora.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Date: Sun, 29 Mar 2026 11:21:53 +0200
Message-ID: <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57500-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 37343351586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



