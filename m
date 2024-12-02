Return-Path: <linux-media+bounces-22424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5749E0150
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89E46B307BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B081FDE19;
	Mon,  2 Dec 2024 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAE+IZ7T"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B41FDE13
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138252; cv=none; b=hNKURUhwhmaq0ulStoj2iyT9694s+73m0VJ+R68sdlRhwtTcv7Y15SKRwQBcFdus6ruTExH/I/mbGzmID3qxte9h/7u/I8d+aoEis5s1jI2axYxAA3vkAHYYkB1EW2ynnwvdZ+OWwMJtpRocf5qfFE5Szxx4z3B+33LSbR0xuT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138252; c=relaxed/simple;
	bh=ytSsduTnkONAh6ajkTWEfie59uFZVotilKDmFQ0Z5h8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bsLASetSw1AG7dWDd9MqemACJoy+A84YhYgbTz0bHDTHfV8gUbfCnm03bh32ZEki39IsdFnxUoinwuAO/WS4jToKZtFygV7lbs919Y3sKEt9eIaw3bTfBxXp3nK5yEYkgIp5J15n56wT5HkWfIGzDqUplqdm2ft/KAn0rWpUX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAE+IZ7T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733138249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WAlsAj4vzDbcoRuVh4t72CipvNlflr+fLRKxuNSUS88=;
	b=cAE+IZ7TITKS4S75kjJY0kOTzUDWJGqxLdJoO5y72XeagVHv0wHYqrAZtEA0DSFmqimNhf
	M/updXBWR/TXoTyQONPgZatCn3xBwO7j5hdptAH6fhM/nj3fGxKVRXtE+M/ATo6qRBleFX
	3YvuEEdlsZX/CnlkiaPf6KzkvqYUTRY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-IeWkZPcCMtWCqwLN0Mw2XQ-1; Mon, 02 Dec 2024 06:17:22 -0500
X-MC-Unique: IeWkZPcCMtWCqwLN0Mw2XQ-1
X-Mimecast-MFC-AGG-ID: IeWkZPcCMtWCqwLN0Mw2XQ
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d0b063a162so3126513a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 03:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138241; x=1733743041;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAlsAj4vzDbcoRuVh4t72CipvNlflr+fLRKxuNSUS88=;
        b=hRVfN48UKZiJV2CoSfAdDt11UVEB35f/L3Y7ub65a8MpIBUlP2RIevTgSGJ6cyaUeI
         /uSPWWGFtJNWy9485DQebgr06zQy01vmv1Jh0cWLlPLd14OiLyjFvp/pRS9RNXxAeAP4
         l6sjiNgvFiRbGcVuiRMjM2xXABx//0VxA9qSA2uiieSw/Y2IIVbFmcWefj/+qYXepecg
         KTkG4qYEagyEJEF4EoHcitTMhgVK116+waHhYk+BKebXLn8NBmYzmFta9wAlVe2ZzxfO
         PMmRXTsx2BvDv7qRa+m8AnorOt0/NbeEyYBEyyAOKLaL/Tw8uIm9UnX/rOSH8K097bqK
         +Lug==
X-Gm-Message-State: AOJu0YwEqP88vqboTT2rbFBrarKmUxF0cMH8u5NrxZcH3+rkWSFCp6eu
	jB7wEyaYoAA/Qtu+446pXdXYVrUb1u59VaQXW8yFl01pPkkLoZ4Q5D0ZWLK+KeTPzQqGKKtK4o1
	WT6jXXrIbhQpkGxyxXSEg4HMcFvFoGeeR81s8RYdlSdJHv0opILx0lWvRd9oa
X-Gm-Gg: ASbGncuFgwMckJnCQXWGpHAAJHaA1LAC8SdChT33fvR0jfUlEmW3mXXJG5/fxpqcemn
	Z5RzqSs2+mybvZ29JIJ4P1SEqaJzRTnwVWFoYo2Hs26nSrZ7p9aphECqPpIvnveQBO5xkJsSeae
	Vb3/AzI8Kv7/Hnk4U8UFu7sHHlUiQ2SiJR0pOZNVUAQB0vIX53gz7VB7ySghXnH5sOWol/AFolG
	jTv3oOx/u0b+8zBnaB61JVaRW/jzVkKCYFMuqOMO+DHn/pUUVf3+A==
X-Received: by 2002:a05:6402:5191:b0:5d0:c649:b2d2 with SMTP id 4fb4d7f45d1cf-5d0c649bbc1mr14322294a12.1.1733138241629;
        Mon, 02 Dec 2024 03:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOUarwQQYMn5G+QF3K0T862jNhE+hugPBxj2o1gJMARLNyxJllegcX/vkLqfZHAd29covrFQ==
X-Received: by 2002:a05:6402:5191:b0:5d0:c649:b2d2 with SMTP id 4fb4d7f45d1cf-5d0c649bbc1mr14322272a12.1.1733138241316;
        Mon, 02 Dec 2024 03:17:21 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59991f0ebsm495947866b.159.2024.12.02.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 03:17:20 -0800 (PST)
Message-ID: <fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com>
Date: Mon, 2 Dec 2024 12:17:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: uvc_ctrl_commit() not rolling back / restoring UVC_CTRL_DATA_BACKUP
 of not yet processed entities on errors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

While reviewing Ricardo's "[PATCH v4 0/4] media: uvcvideo: Two fixes for
async controls" series I noticed that uvc_ctrl_commit() stops processing
entities on an error:

	list_for_each_entry(entity, &chain->entities, chain) {
		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
					     &err_ctrl);
		if (ret < 0) {
			if (ctrls)
				ctrls->error_idx =
					uvc_ctrl_find_ctrl_idx(entity, ctrls,
							       err_ctrl);
			goto done;
		}
	}

This means that if there are further entities with changed ctrls
in the chain, not only do the new ctrl values not get committed
which is expected. But the new values do get kept in the drivers
cached ctrl values.

I believe that what needs to happen instead is that the loop
over all entities is continued, but for the other entities
uvc_ctrl_commit_entity() needs to be called with rollback = 1
after the error.

Regards,

Hans





