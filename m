Return-Path: <linux-media+bounces-57788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOJmIuTLy2luLwYAu9opvQ
	(envelope-from <linux-media+bounces-57788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:28:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858136A3F9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C453830BDE3E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F34C3E6DCA;
	Tue, 31 Mar 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKDlbfPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D053E3C48
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963241; cv=none; b=ZJjazHDbWkyszBcsjOkSrTKoYQTLKGaGOiVD3apFC5t18xo/clPiyqPwkPyKyiutpi28RAD0rbgswwxgw5EQ9wrjRkydeJy6KfJL9MRJEkEqmNDHegZq/upa+x7FyN2waduzA/ZEh7OCum51muuDMiGiXpJ7bUyxDbOMP3BfdSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963241; c=relaxed/simple;
	bh=FHCG1eyKPTFyYzgTJ8AuOuQbuY4G/koxwDmMSh7hUqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8D0m8KtRt0SmpSmWZEL1nYf2QrQvgXStsxpi3XExjnX2tizY4YXEc4Zzle7ztRb9h4WEMzu0KNjyb217ZN9ZpyvX0YvweKisea4FW9VVKLtz2YWdVNkDmNpTXc6K3sZRDnO/CHWxD9WzXOhWivyQkV5aUA9Q62jilsmperpwP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKDlbfPN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso30289e87.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963238; x=1775568038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=YKDlbfPNBYT/RzZYT0AEy6bhZdIHIaPWEUMKgdo8Qw1uLVnbYcmnuAON9e+9NWXl3I
         TVPzZwo4e539EPFMnU/Uuj98yNLXnYyDgisFZdhnDkqPTZOnEFcVmMjpsAhFp/+0ASi9
         o8RE7rGXKvak62nMUm1uWGjH1iXRdSk7qVMoIK2jDBf+OE4RPcuMoXTETfgkONUqmftO
         Tmh0k3LcKw1nb4dMHiy5uK/sRPBlBL6WjR0oIIKOLhDas5M9iRdJ2983ZszUmwCIc2kx
         Li8dilXnUx738GWXm8oyn6cjrWcrjMUBeBwy4Kttf1qg1b508IJ5I1L2PK29FsCDitpY
         8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963238; x=1775568038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=TnUDkkQoFyXu4Lpu/mjGQR4GHPXrQ8U+W8TJ6Z7ldQX1keHobSyusZwiPqKbrOolUH
         HE0SbfHTakSGMpgjhAsZ8ajL7g9x2JK0W7VS9Ykxg5HE5Pto1thPYqPEpRnV1FRyLvEa
         mUosC1ABJoGSHVjxN7rpTiUSRBLJdhvJun9fklMzrrzrGmhBD7rRpvjHCk7jqFSRer0c
         TLznarBlMt9GfFHKrw9bpaHPlQFriqi7mZiWjEL/yAfyVBzcvSzmaSrdd5v5sVSnfWf4
         CHg8bvfJ+qL6gJaEtk81vROtshm/v3cSKcfo60OZkq8eNf2dduOhkE+kuP7p+8qdxpnP
         5ouA==
X-Forwarded-Encrypted: i=1; AJvYcCVRVzcd1IMMfLCLrWSVNwYnsH69rLW+7SphcyCazfLnW4E5r9aeO7z18tIGAOdbPGaIB4B9wgMC/Zo+7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOa+ZqjeZt/Jm2H26moPTng0XOenHkIaOk8LtuU5mx/I1pKud/
	KVaYRUljrCnbQzewvfMjWYWEBNGlZqiTvKyGQJG8PzPSXzvuVCbz+YAE//X30h9/gIE=
X-Gm-Gg: ATEYQzzj5GHBwRUPpc1GSC7VXnyfoceSeUSuO7PGUSSVjTzDcLjIdpw/4PKLxU8GexX
	Si9gQlnXFVb3Z9tm4YHAhhQjFNum7w4Mql7hYAYwRGYSVG6mAT9W6Fzuu7eKEh4oZzU/dXDsxPi
	5eda9Q848ZLWnGAx/jH9JcllXVkEbnHSvEv+CYkDkQCxOcJlOplVUUn5f5vZcYadzY0eoO/68WS
	3mvM9+fDQ5XiGWnpDdnH9Op2ATFYtd/nsttNeNFilDqj0RFjJmTECWZZBFEmrTTJEjb9NIwCYy4
	XAWSQY3Wb0+/yPdcl++sDtsYDX8C4xALq+V1Gxh/H+Q1r35xuyE2ciAA5t4yeLsLHQ1NMQbvPvP
	lB8zPTG5bCNmnSUY6rtHHUrDwqE6DW08EK5BaYctOJJpWy/BT6dzj3+FCm+p+iJ1LvgEgmr5FQv
	bNh8MwocUHDy9V+Na6YFSRHRPHXDhYcvL3DTlcwNfDjUV8YhvexMqZknmDKYjOzXl+MSzwfDIT7
	L6Hxg==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:8516:a52a with SMTP id 2adb3069b0e04-5a2ab5fcfcamr2769606e87.2.1774963237655;
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4d3sm2395494e87.34.2026.03.31.06.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Message-ID: <bc4579ce-294b-4553-8166-55cf4888c6a7@linaro.org>
Date: Tue, 31 Mar 2026 16:20:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57788-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0858136A3F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/16/26 10:54, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

