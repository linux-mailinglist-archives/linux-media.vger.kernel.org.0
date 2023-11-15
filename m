Return-Path: <linux-media+bounces-377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FC7EC4D8
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 15:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79891F2744A
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 14:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF1B28DB7;
	Wed, 15 Nov 2023 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C49286B5;
	Wed, 15 Nov 2023 14:13:03 +0000 (UTC)
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1FDC5;
	Wed, 15 Nov 2023 06:13:00 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 725DF24DB83;
	Wed, 15 Nov 2023 22:12:51 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:51 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:50 +0800
Message-ID: <e7c887a9-d08a-42e6-ac21-effa8e2e620b@starfivetech.com>
Date: Wed, 15 Nov 2023 22:12:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Shengyang
 Chen" <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, "Rob
 Herring" <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Bjorn Andersson <andersson@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Shawn Guo
	<shawnguo@kernel.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
 <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
 <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

ok=EF=BC=8C I will do this in my next patch
Thanks your advice!

On 2023/10/25 23:44, Simon Ser wrote:
>  it seems like you could start with just simple
> enumerated modifiers like Intel does, and then only switch to more
> complicated logic with macros and fields if there is an actual need in
> the future.

