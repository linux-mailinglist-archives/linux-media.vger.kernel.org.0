Return-Path: <linux-media+bounces-4293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94B83F9F5
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 21:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FAAB1C21BA9
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 20:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B407138DFE;
	Sun, 28 Jan 2024 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dn682Px8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0731A73
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706475531; cv=none; b=Y2KHxZEYxUNCW4+lTY+EIb3n6qljUQz8+4qV0YojoPejj5hqL61AIu+9ySlZoStId4tz7kKLLAh1siIkjArVkUgIiGXtXq2ptr65D2UrL/G7ktnrpCELYp0JfPMqiu/lF/UYr4IDHAKoUZBkcFdxczZrUMOkWfbuIpFiFTnTPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706475531; c=relaxed/simple;
	bh=62Q7hwfACeQdUw8IaPs+IUlcv1LZyRLv0ed0go2doNQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=P4MKmB1n2rTKiw7QgAK8iAAUGdZMpsi3i6ByT1RitDkPECw6b1I77cXSEBHdZbxb44vTgPir33BQRCa2lYWIBKzoSd+ghfUr4D/S6Rk+gXT+2L4zuvsTBx9O2H7AKLq/ZAMQlcAWG8RyUMpWTtgshKqx44DZMXLkAFne5oGp3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dn682Px8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706475527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=62Q7hwfACeQdUw8IaPs+IUlcv1LZyRLv0ed0go2doNQ=;
	b=dn682Px8edgFF6OHnWz7fGTo7w3cpTtg2XkHRauZbM5kfe+Q6G7SaywNW7tbVva5Qh7PGo
	lfq/OhxmG6F7fufCR4BLFpvpdAZeyLbUwszTgYped6gXgV5mPBeNrzVxtQdykx/0oMIkJO
	BpUhklW7gTiRMV7GUg4PoiMZeBwHQhE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-cf6qbU98NKmDItX1SkTuOw-1; Sun, 28 Jan 2024 15:58:45 -0500
X-MC-Unique: cf6qbU98NKmDItX1SkTuOw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51014938fb8so1261884e87.2
        for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 12:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706475524; x=1707080324;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62Q7hwfACeQdUw8IaPs+IUlcv1LZyRLv0ed0go2doNQ=;
        b=GHivp5is4ENlSJRBLKG97irnU0Of6TR5FO6Ur8UG/AvoBFWiXGnG7YbnUCE18Uwfcq
         yCW2qozqRGktFPdsAor/yC8xX9u/wObMvGrc/SDwebH4q2WWHoA62gbELzLa1i8tu4Ry
         MU43H4NqCTOHo2Kx9AI7rIwumvjziZ6X2oZzb1SCA89d/kPxdsbSYDYLGBD0SuQItJVD
         Wadc1dx+Vqgc5+lo9cuKA664cwfnAG0R8lIfekAoSCBPX1vEkIzk8ywel/05yq/zoLr5
         eTattSA70xXDrGKHXIrSCOY5adho/4d5riyQgRPvT6oVSWU226ZMskf4f1qCBK2s+Z7Q
         7gNQ==
X-Gm-Message-State: AOJu0YzmWc9/c/NjPheMK9pZJ7ccpJTy/E7dhqXkb7idb2WUSImU/kq6
	yqcp2rIDFuuh4/7M3hlCromBFNN4U4YHePDPW87XkD75HhqT9FHYfB4cDwN29L7cfX+FDXMddu5
	EXJBdrBSvL65Rukcd3EaYCYtMYe83xD/SE3XWWXYIAYzl5UTXIH0bZgtRk++DF7h7BaE+zTr2mw
	27SXgjZy9pkcOwL1y7Z76znB54jhAoW686THWayVk2eoNo
X-Received: by 2002:a05:6512:1599:b0:510:286b:8882 with SMTP id bp25-20020a056512159900b00510286b8882mr2822363lfb.3.1706475523919;
        Sun, 28 Jan 2024 12:58:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYMz3M2uqDUqiUhnbiTqezTT+rr7Ge8xzQpGZsJDY6aUIDnDWqLdE6w43LlqXr5pL/NK+36Q==
X-Received: by 2002:a05:6512:1599:b0:510:286b:8882 with SMTP id bp25-20020a056512159900b00510286b8882mr2822358lfb.3.1706475523470;
        Sun, 28 Jan 2024 12:58:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906415a00b00a3590fb191csm965248ejk.150.2024.01.28.12.58.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 12:58:42 -0800 (PST)
Message-ID: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
Date: Sun, 28 Jan 2024 21:58:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Weird default vblank value in ov5693
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

While adding vblank ctrl support to the ov2680 driver I was looking
at the vblank ctrl code in the ov5693 and I noticed something
which I believe is weird / undesirable.

When setting a new mode the ov5693 driver does not keep the current
vts value (adjusting vblank to keep vts and thus the framerare and
exposure unchanged).

Instead it calculates a new vts value, resetting the framerate
to 30 fps; or 60 fps for smaller resolutions and then sets
vblank to the new (vts - new_mode->height) and adjusts
the exposure control-range to fit within the new vts, potentially
also changing the exposure value.

This behavior of the ov5693 code means that switching resolution
also changes the framerate and the exposure value which seems
undesirable.

The vblank and hblank control values changes on setting a mode
is unavoidable but the framerate and exposure value changing
at the same time seems undesirable.

Note that this also halves the max supported exposure value
when going to a lower-res mode even when userspace never
touches the vblank control.

Regards,

Hans





