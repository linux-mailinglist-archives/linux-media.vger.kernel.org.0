Return-Path: <linux-media+bounces-44072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD5BC8CC2
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 13:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AFE19E8276
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 11:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A0B2E03F0;
	Thu,  9 Oct 2025 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VRa6RD7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387F2D9493;
	Thu,  9 Oct 2025 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009237; cv=none; b=gWbcILSCw4EkRvRUCueYQQu9xhywhXXniKV9nLCaKj9XRS5MMYiYGmpSvd4fEVEAlV5YLzLKGeDQ48kt1C/PSYhMMP9LwQIsV1adDSVcH0SVs1muRwpNE9+d90Y6MNEYr/3KTmpUTv2O0yViQ1UtI2R6nvKfZjKqTFzRq2xUyYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009237; c=relaxed/simple;
	bh=Ci7fJTXqo4Z20C2XhPVrLu17OYCK7HuDTL8uZuZ4OA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0hciE1Xx+pabop3pIpqIAwuKFRtSXOP1O+76VRV7kEI2EUrV2KISjkbXmkRE+kQGspnK5a3uJfzvm6ObbgY44MpAleTdHPt6ogEUKNC6CboESDHVWEjjIR+8cZ4G6MBORGWIid3YrXXR3ozyjhljVQy6b/P3ibJv9xWVyQN1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VRa6RD7Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009234;
	bh=Ci7fJTXqo4Z20C2XhPVrLu17OYCK7HuDTL8uZuZ4OA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRa6RD7Z4Ol1Fi6WqTpUb4G5Kwx/WEEJvoDj3O7XI7UtRxwsZWqDvZi7rz+8Yi2U1
	 74l8i5c1HmW7+/oIF2wwuVu/QkUH9oXcRxE/Sl4YTESoHst3p6/6x+QKOvCzENZkM9
	 vaEI06KKa9cZkQ5utMuvB6whcGIWEHeF494dGEtt/Qz4kp37JTpsU0a8eiqIiMr0n+
	 E0QV7nmS4cYw3HbxyzuCVpYqC3+h0YNKCD7MxCbCvevMfWnWDZgNr03vFG9PPrsuwr
	 J+XsyfNE2DEqTZYSlQF8/UPho0EX4DH4N/l4YtafPp3fEtorvPw0gR00MPOvndUMlU
	 9h+U96Rz4XV5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C15F17E0579;
	Thu,  9 Oct 2025 13:27:13 +0200 (CEST)
Message-ID: <044f8f98-7ae2-45ef-9b9e-a112d7013e5d@collabora.com>
Date: Thu, 9 Oct 2025 13:27:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> The GCE hardware virtualization configuration supports the isolation of
> GCE hardware resources across different OS environments. Each OS is
> treated as a virtual machine (VM) for GCE purposes.
> There are 6 VMs and 1 host VM. The host VM has main control over the
> GCE virtualization settings for all VMs.
> 
> To properly access the GCE thread registers, it is necessary to
> configure access permissions for specific GCE threads assigned to
> different VMs.
> Currently, since only the host VM is being used, it is required to
> enable access permissions for all GCE threads for the host VM.
> 
> There are 2 VM configurations:
> 1. VM_ID_MAP
> There are 4 registers to allocate 32 GCE threads across different VMs:
> VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
> VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
> Each thread has a 3-bit configuration, where setting all bits to 1
> configures the thread for the host VM.
> 
> 2. VM_CPR_GSIZE
> It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
> configuration, where setting bit 0-3 to configures the size of host VM.
> This setting must be configured before the VM configuration to prevent
> resource leakage.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



