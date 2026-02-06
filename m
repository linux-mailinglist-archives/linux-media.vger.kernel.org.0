Return-Path: <linux-media+bounces-52304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP2uG2bwhWkPIgQAu9opvQ
	(envelope-from <linux-media+bounces-52304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:45:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B78FE5D3
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B26E8305D28F
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30777367F56;
	Fri,  6 Feb 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ck16nTLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041936CE02
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385197; cv=none; b=Pa7tORvhFrMWxH2/11fII0rc+1gHtsphhcDuFqg7pLTOxiIQH3KgnZ5o2/1L/snuW74Fz8hnorW6MOxcb88vQdH3uWJm8B0TJWZUDxDkWZnwggph74cL8WMuREuOWgayzaMbIK+I31SuiQQsGUiM5XDLvEv1ADec3M1lcmbCkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385197; c=relaxed/simple;
	bh=ui9sKOmtWTpThirBsaM2PaQ100m/96b72nH4caIV4lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cnIFpD2kMcQdmebfXjj3TFX6oW9U247PVyKzs1H4RxVr+1mY2DpxyGj3Tgqo3IFbpEh10QrX698xwvhzvCcHa3nEkOQGIeoxk6aZCAkGOfT+WVbOytbM5N0Mop1X0t7m46FEKPe6TeY4yJ6sh3d3OBHa2B2gKBlVABjXn15KWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ck16nTLI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806bf39419so19440275e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 05:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385196; x=1770989996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DpawWM0L1bjHsi3UTj4Y3hlyX0qOr0v1C1K5DEznKQ=;
        b=ck16nTLIhwLgb1TejJUNXo2fCxd04cwkDU8JARz6rpTeJKRj5JqpedGki2Oty3Yd19
         69y/8WNn2kx2tONjqWCiPrhUitUsnklpUnnDd5lkF5uTYkT6pIBaqVCbDRubQVh4/hrd
         BoMU00I6DrRyTvjE7q8E5MSLUtInrRxXcsu00IPMbPayvjhSmMFFWvPTsktTEvC1yN9P
         hYF4nJWBmRnUwUK9w8KT8HodbL3RVmUEgtMpJDF1gKGvv1M5XehsgwMj5Hgy1L666tFV
         CP2YJ3rjMRNfH/nyPvr6AT+sgDiV+s5LkOEz9F7tJ2l4s76dfMyK7l+dc9JTnQPZUKBP
         B5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385196; x=1770989996;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DpawWM0L1bjHsi3UTj4Y3hlyX0qOr0v1C1K5DEznKQ=;
        b=G2+pq7UIWLv1VrLCcOiyBe42itg7uVKpa+AKD/DybHP66kR3VXT8KXLQ6dypx5+D73
         nLcSgWe+TiW46MBonu7zZQBqf0WIqUprHegIwIPG4rd74ncpZLaXMZTgDAdM1JhXB0Bm
         PZRSHI10+5+q6uBCcgJrUij9m9dvZyU7lH4PCFp5aNhiriUzX1PV6J6rap7OGP8FHqT2
         8DsUX3YffMbDITONbNoiX4Vt9OqfHcLX7ZvvLfgHhIHkmaJUtfS60he2NDC50JDlZdpn
         EfZWrIHtvNlf0vPol3H11YkmIfrXU11K6TQl13gOAiiQK29FpOwawLo63B4Q364SyLcd
         Kzpw==
X-Forwarded-Encrypted: i=1; AJvYcCUYJMkD6d+qovHYEyAxpHkqHXg5nxy9SBQf4O8rf2oFZpEynVtgKKmyPD0TSYf4ZiDHN+7MuP9hsSMoCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTktzdkSPPXhiNhZEmiZavVDFCq9CdKtydOu/awogPZQs+3UeU
	/wbsRG72+Y4KWNX8Utnt48RH8zXc7jwTI4BLuvd3KGDdnGWj/yEYTi5LGR3U65EFY+Y=
X-Gm-Gg: AZuq6aJMBxSL8f+rbrWll4ndjvqiWGD5tZzxwSksRxltir4WtmRpenwMhO2y9nXVy2J
	yNm4cymecG2ZvHaV5wjzXazu/fe8CxFu+5cEqNHmOEsBcEqqVI7qixFsA9Jjf3mceesoNSlV+mF
	hGg5QvpH48iAvkIYcl4616AOJkidpGXI29Dx6YtcilvExcU+m2wyptedO6scpZiDQ5i1Y0dqPNa
	e312PQf8oHQT1pZL0MQVHc2Cxx3IAZ7OAXOFUD7XbHCx+KiuYlSKRvmDxG+M1Od2DmWumUFcJBb
	YvfOANC93W+EtjsJJ28Vx/ZKu/tGZS+tU7pnedBiPezYOtn1oVTy+idqnnNkcVckpMNAt13F5XC
	gJhqqW17Hz19ZL4EKDsRUNHscNT6QGwSpHZvnOJ3tLscTN6HPz/f4zm1VSuN9xCgwSFNza7F24w
	eA8QwDrOe1MGpDGxzuoveRM4jgSiM=
X-Received: by 2002:a05:600c:5619:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4831791784bmr62231045e9.11.1770385195657;
        Fri, 06 Feb 2026 05:39:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d33f5fsm133089325e9.5.2026.02.06.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:39:55 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] media: iris: gen1: Destroy internal buffers after FW
 releases
Message-ID: <aYXvKAX3Pg3sL37P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52304-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: C8B78FE5D3
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Dikshita Agarwal,

Commit 1dabf00ee206 ("media: iris: gen1: Destroy internal buffers
after FW releases") from Dec 29, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/qcom/iris/iris_buffer.c:588 iris_release_internal_buffers()
	error: dereferencing freed memory 'buffer' (line 585)

drivers/media/platform/qcom/iris/iris_buffer.c
    572 static int iris_release_internal_buffers(struct iris_inst *inst,
    573                                          enum iris_buffer_type buffer_type)
    574 {
    575         const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
    576         struct iris_buffers *buffers = &inst->buffers[buffer_type];
    577         struct iris_buffer *buffer, *next;
    578         int ret;
    579 
    580         list_for_each_entry_safe(buffer, next, &buffers->list, list) {
    581                 if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
    582                         continue;
    583                 if (!(buffer->attr & BUF_ATTR_QUEUED))
    584                         continue;
    585                 ret = hfi_ops->session_release_buf(inst, buffer);

The commit adds a free of buffer to ->session_release_buf().

    586                 if (ret)
    587                         return ret;
--> 588                 buffer->attr |= BUF_ATTR_PENDING_RELEASE;
                        ^^^^^^^^^^^^
Use after free.

    589         }
    590 
    591         return 0;
    592 }

regards,
dan carpenter

