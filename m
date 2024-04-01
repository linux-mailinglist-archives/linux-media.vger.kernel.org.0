Return-Path: <linux-media+bounces-8305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA3893BA5
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 15:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E932E1F22174
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 13:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732B73FE35;
	Mon,  1 Apr 2024 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="joVkKUOI"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7112206D
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711979753; cv=none; b=KnvHWV8QGTK1UMsOKYGDN1a1uAqgRgyFIJZ3GptnpsDw09e+3/LFRK217cAwM4V2DQnQN4Ngcw9MGExDP9QU07B+Jr4JTlKtOlG2e6dXPnzvecFMee484W5cgD58syO2H0trsQf3C62AF4BRARPdME3p/Ql6rR1Ko18rh239dm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711979753; c=relaxed/simple;
	bh=a0q5MN/j6vBttWMacYT5aWunlKLGo8NdpwFfyc788hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oeLDKdZgofXkNxOxKw26kdUULoC561vOUB6oJzGEK6gfFFVkqcbmwIIHfo0+euCon9zGENURpVN/guWasmgK8yfun9Nk0BJ3LZMvNHEMESVb0++9ITnCg3Z+E1XWO3+EluDOLCanBE2ukFB5JzNctoYiCOk5UfQcUJije9btO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=joVkKUOI; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 431DtlvS086816;
	Mon, 1 Apr 2024 08:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711979747;
	bh=cXBERdz2bXD3Qgcm0BgltgaFKnSs+KzPaskA8uOk6/A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=joVkKUOITrjp1pnfQVpQVSw2cBcFKtiS60QuXmaGarM5/LZgmeGdwEp6ZjkGdAf8o
	 Wk4zt26cnl4OwFAgDRl9EEDYVPS6WfW6t3IkdJnLDdRKcHmIuaMSKap2OKOdRI5eMv
	 Db4K2kyaqm/QI/SmdQljUSBtxwJI+qIZUStBjZsk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 431Dtl2x006369
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Apr 2024 08:55:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Apr 2024 08:55:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Apr 2024 08:55:47 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 431DtjW9082352;
	Mon, 1 Apr 2024 08:55:46 -0500
Message-ID: <d6e24bb9-dfda-b5c1-334b-1491a8e0a790@ti.com>
Date: Mon, 1 Apr 2024 19:25:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL FOR 6.9] Imagination E5010 JPEG encoder
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>,
        Andrzej
 Pietrasiewicz <andrzej.p@collabora.com>
References: <20240309151528.ayphvdpnj2crvycv@basti-XPS-13-9310>
 <a6652d2e-8fb7-4532-bb98-62c22aeec07c@xs4all.nl>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <a6652d2e-8fb7-4532-bb98-62c22aeec07c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

+Andrzej,

Hi Hans, Andrzej,

On 18/03/24 19:13, Hans Verkuil wrote:
> On 09/03/2024 4:15 pm, Sebastian Fricke wrote:
>> Hey Hans & Mauro,
>>
>> These patches add support for the Imagination E5010 JPEG encoder.
>>
>> Please pull.
>>
>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>
>>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-e5010-jpeg-encoder
>>
>> for you to fetch changes up to 146a5dc5f8baee4178a1cdfa483aa3c94273ce5e:
>>
>>   media: imagination: Add E5010 JPEG Encoder driver (2024-03-09 16:10:43 +0100)
>>
>> ----------------------------------------------------------------
>> Adds support for the E5010-JPEG-encoder
>>
>> ----------------------------------------------------------------
>> Devarsh Thakkar (3):
>>       media: dt-bindings: Add Imagination E5010 JPEG Encoder
>>       media: jpeg: Add reference quantization and huffman tables
> 
> This should be added to v4l2-jpeg.c. There are also a few other
> changes I'd like to see, see my reply to this patch.
> 
> The other two patches are OK, but since a v7 is needed anyway, I'll
> add a few comments to patch 3/3 as well.
> 

I assume you are suggesting here to move quantization tables and huffman
tables to v4l2-jpeg.c as static arrays and implement new helper functions
which in turn use these tables to write jpeg headers?

I think Andrzej had suggested as similar thing earlier [0] to have a separate
jpeg helper library for writing jpeg headers (which in turn will use these
quantization and huffman tables) which can be used by other drivers too (for
e.g. e5010_jpeg_enc and hantro_jpeg can use these helper functions for writing
jpeg headers), so do we want to implement this helper functions directly
inside v4l2_jpeg.c or create a new file?

Kindly let me know your opinion on this.

[0] :
https://lore.kernel.org/all/307911e9-7e0e-4a10-aeb1-6c72896c1454@collabora.com/

Regards
Devarsh

> Regards,
> 
> 	Hans
> 
>>       media: imagination: Add E5010 JPEG Encoder driver
>>
>>  .../bindings/media/img,e5010-jpeg-enc.yaml         |   75 +
>>  MAINTAINERS                                        |    7 +
>>  drivers/media/platform/Kconfig                     |    1 +
>>  drivers/media/platform/Makefile                    |    1 +
>>  drivers/media/platform/imagination/Kconfig         |   12 +
>>  drivers/media/platform/imagination/Makefile        |    3 +
>>  .../media/platform/imagination/e5010-core-regs.h   |  585 ++++++++
>>  .../media/platform/imagination/e5010-jpeg-enc-hw.c |  267 ++++
>>  .../media/platform/imagination/e5010-jpeg-enc-hw.h |   42 +
>>  .../media/platform/imagination/e5010-jpeg-enc.c    | 1553 ++++++++++++++++++++
>>  .../media/platform/imagination/e5010-jpeg-enc.h    |  169 +++
>>  .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
>>  include/media/jpeg-enc-reftables.h                 |  112 ++
>>  include/media/jpeg.h                               |    4 +
>>  14 files changed, 3142 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
>>  create mode 100644 drivers/media/platform/imagination/Kconfig
>>  create mode 100644 drivers/media/platform/imagination/Makefile
>>  create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
>>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
>>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
>>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
>>  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
>>  create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
>>  create mode 100644 include/media/jpeg-enc-reftables.h
>>
> 
> 

