Return-Path: <linux-media+bounces-794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB37F4552
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492321C2090B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615255647B;
	Wed, 22 Nov 2023 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Egzu2h+C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3048ED40
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 04:03:39 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso5324468e87.2
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1700654617; x=1701259417; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cTmUhwIZMdUL5arPtjIIT/xe6vK2ULCVvZmlUK+YHG4=;
        b=Egzu2h+CxaadwU9RuomR7oDOwcCnu9V5dREqGgv+Tyrob/AdlxmfWtOkNZvrNzvcpv
         SO8tUOm/WKy2a2za2iivNiEM7MVYKOjOn2ROU58oUCEvhk4rOHAa8bw12He3nGgjV4H9
         6yDGhd601QrUlW3LrWYe3fqPNM6DDIXv1eMNRs0RUQnoK7NQ3qbfgNkMQlA6UXLK4o4Z
         jOQnTxNqpqFyIBK0ZFtCBRB4VLPf4q2WX17cg/eP2xqlQOiJA+/dLVLVTVSW0nCZI7Xg
         zPMzU2NQ6EKmZqrmc+XCm1h4ebOJbxi/EQ7GGV28felew1Y+oaF4nl0I97z0/PvvaP/d
         fKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654617; x=1701259417;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTmUhwIZMdUL5arPtjIIT/xe6vK2ULCVvZmlUK+YHG4=;
        b=ssN1BlPb/jcvfVaYZungbgLRxct+HEwIEA/a4XLcivSDuKMKaQAZeG5mwQZk8yMkN8
         fchVd4V+v21AiFUyexIxDuFqis0khlswhHo0OkjykbX0GclW5twYc/FfrxBF653rUYcz
         FVnBQtYOfvqab+aBqux8wEVvZWhm/IasbzqKC+kLbaVdSy+eBeSDVROb4bhF2Y+R97HP
         tuyyBh8N4YQMHfkq3b6cpg/mUurgGuWeK5bYAj8OAbuxgFbBd5r/1kd4tfqitWWH/wBV
         UUWp80/2irtiozG+FEwUJMWzltSknrVgt6VLkcvks+3pHv5i5otgg8DgUz1GQCC+wjfn
         kHyw==
X-Gm-Message-State: AOJu0YxWURcPdn5NSiexwBZNm4/n+6kqvfz8kO2nErGxehoCY4KiRZBZ
	5TxdsamB0GXwiq15qBmFyV6Mw/FpSPjrUw==
X-Google-Smtp-Source: AGHT+IE7X0iY0mjqXc5DelFnS06RCPlGVMKB3g5POZuohPBHdY5VmNL/NE4Zxihx1q7LfpnLKIJivQ==
X-Received: by 2002:ac2:5589:0:b0:50a:6f95:3b50 with SMTP id v9-20020ac25589000000b0050a6f953b50mr107211lfg.16.1700654616664;
        Wed, 22 Nov 2023 04:03:36 -0800 (PST)
Received: from [192.168.0.210] ([95.90.91.143])
        by smtp.gmail.com with ESMTPSA id q25-20020a17090676d900b00a0173cfaab6sm2375328ejn.44.2023.11.22.04.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 04:03:35 -0800 (PST)
Message-ID: <12b6687c-2517-4844-abd4-1e64f83c27b6@googlemail.com>
Date: Wed, 22 Nov 2023 13:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>,
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>
From: Gregor Jasny <gjasny@googlemail.com>
Subject: New v4l-utils release?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

do you have any objections or blockers for a new v4l-utils release on 
the upcoming weekend?

Thanks,
Gregor

