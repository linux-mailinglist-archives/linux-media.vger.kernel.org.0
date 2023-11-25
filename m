Return-Path: <linux-media+bounces-1017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B65857F8C8B
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 17:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3D61C20C01
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 16:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26F328DA2;
	Sat, 25 Nov 2023 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1KtlGsz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35972AA
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 08:50:13 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-45da9f949aaso790357137.2
        for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700931012; x=1701535812; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=T1KtlGszjiiJj9lC8RSLsdhpe1YaY1xqopMeY/Q4ZbCFm4m8Pb9BshPhtjDL0A4Mlq
         RO2BfcuCNaeJR6vMt2VSZ7VOf4rQh54qBpPoSYAqBTv38NuNtxJtDoE8UllzKWUgh3pC
         wrC2ks+lMPJ3n3Os1l0fHtlZSsnLE5ljUdpV5teYftoUdMCjRNGHlBGsOMJ4lfWdFPMO
         30I9cf8zVCjR8YSmeHDnI7E0nSZ1w4HotKuEuD+7mH/ZJ8nduE9AHjIM9exon5k2/AAw
         pKYYhYHas1z6aya3QIA1FlYDwz7BlB8HHpBJltTOYcVWMXhdWslwoZh8QPhTWCixeY9j
         59+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700931012; x=1701535812;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=IyuGt51QrWxaYHYo6yxeW4I0QXqZCkyhmWGefZ+yX0vVW3/QWdCOo41NdJkex+al1N
         vAganGXIcFjrE8BPPW/BmQEWC3Y1L+5Bzah3WyjQgf4xNQhw0L/1dZHEMXJd54KGtdV0
         n8f1rwd8Mfoy5TM9AxfMKLYM/f2mALCoWSl7x+EwGA4eSO1GpBt9Y8zCkUNFqTfevaVx
         I1JaEBo/FloX6AhmLdLD+llvcGLkZ8bIcEzUvvqea9MGge950LHQNpSPj/auqKzpXIYP
         44qgwWhXFu0Cj6l254WC5HLBsP/mvtXaifJARpduQP+RPyE/uHMZJ/BWLkhqwYh+5NAc
         9QbA==
X-Gm-Message-State: AOJu0YwRr11EnVZcuCRKFDhGBgnKhYGR3aoFIQa8hMtLxrS+44rD21bk
	VSZDZeJSpRiUb4HBw67QFdC1QVu3ejo=
X-Google-Smtp-Source: AGHT+IEp8vWl7n+fSCljhacCmQKt7OM5e5/4T+437QOTyZk2GUkiyLEoleA0GNKVyNOKcKOpejF7Kg==
X-Received: by 2002:a05:6102:7af:b0:462:86cc:92d with SMTP id x15-20020a05610207af00b0046286cc092dmr7085415vsg.11.1700931011795;
        Sat, 25 Nov 2023 08:50:11 -0800 (PST)
Received: from [192.168.1.200] ([95.138.85.237])
        by smtp.gmail.com with ESMTPSA id l12-20020a056102308c00b0045f128ead10sm1052010vsb.4.2023.11.25.08.50.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 08:50:11 -0800 (PST)
Message-ID: <a87e3e66-ca4f-4a32-be65-787483f2b75f@gmail.com>
Date: Sat, 25 Nov 2023 12:50:08 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Language: en-US
From: Emmanuel ALLAUD <eallaud@gmail.com>
Subject: unsubscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



