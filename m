Return-Path: <linux-media+bounces-39381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F175B1FE16
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 05:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E0718985D2
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 03:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB1225DB1D;
	Mon, 11 Aug 2025 03:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kq3UKuz0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF7140E34;
	Mon, 11 Aug 2025 03:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754882791; cv=none; b=Lma6qgFQQW52guxn1NJGnlN1KylqjTn1SIO4ViaGb2vdV8mVT7zmqdjFcuxV0Zt0vtLVcVpupCZ0U+RY7n6WIwMwjeXoingEVJcXNEULAAQ4PDLQh29yf2vCQCi7ebWdfNUlJqS9/jIHrs1IkuUvl2cqtZ4FibipSAXtoo8rICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754882791; c=relaxed/simple;
	bh=enGTt9SMwY9c4TuHCqGxqIRS5dEw45DiMVXsaJ4Ho/o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NElCTuvSJTatOTeUQY7QsvJmGH8Ndm+F3VPOYDkjzeWfjRYx+qOWtdjC5n3gHhPFuVaUmpKbhgyoooBsX5pggCXOGN2dAgHzhzhoT4QhHBOzCov1EswjSObrL50VX9J6nltqt41D1+hZynogV9QFuJ+OH9MNP1DmYHV2l0aZ+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kq3UKuz0; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f4c39bb8766211f08871991801538c65-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EcT+f/N6oe7EZKgGMDbwkDouTM31unC2D7Cmt7xG7RI=;
	b=kq3UKuz0eKxoQAPjMneWAGZ+Y0nSl4ROMhdMPe8zSmpXrEbzsorTsrUn+2Hyd4nYVJ2POXTdPJ8507bQ10Y44/7IhDCLsJltYPKXNUVEu9T/8HPMn7tcC6Cflup6K1KdZrvy9qUXz1Oz8AR7BWonZ7ExURLNnTTsL/K/7Zzwms4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:758a7477-1be5-4b95-b201-2c49baae0187,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:bda444ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f4c39bb8766211f08871991801538c65-20250811
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1671929269; Mon, 11 Aug 2025 11:26:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 11:26:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 11:26:15 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v2 0/8] Enable video decoder & encoder for MT8189
Date: Mon, 11 Aug 2025 11:26:07 +0800
Message-ID: <20250811032616.1385-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series have the follow changing:
Firstly add mt8189 video decoder compatible, profile and level to support
MT8189 kernel driver.
Secondly fix some bugs, including vp 4K profile2 and media device node
number bug.
Lastly, add mt8189 video encoder compatible.

This series has been tested with MT8189 tast test.
Encoding and decoding worked for this chip.

Patches 1-2 Add decoder compatible.
Patches 3 Add profile and level supporting.
Patches 4 Add core-only VP9 decoding supporting.
Patches 5-6 fix some bugs.
Patches 7-8 Adds encoder compatible.

---
v4l2-compliance test results:
v4l2-compliance -d /dev/video2
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for mtk-vcodec-enc device /dev/video2:

Driver Info:
        Driver name      : mtk-vcodec-enc
        Card type        : MT8189 video encoder
        Bus info         : platform:17020000.video-codec
        Driver version   : 6.6.88
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video2 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                fail: v4l2-test-controls.cpp(1171): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 16 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0

v4l2-compliance -d /dev/video3
v4l2-compliance 1.28.1, 64 bits, 64-bit time_t

Compliance test for mtk-vcodec-dec device /dev/video3:

Driver Info:
        Driver name      : mtk-vcodec-dec
        Card type        : MT8189 video decoder
        Bus info         : platform:16000000.video-codec
        Driver version   : 6.6.88
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateless Decoder
Media Driver Info:
        Driver name      : mtk-vcodec-dec
        Model            : mtk-vcodec-dec
        Serial           : 
        Bus info         : platform:16000000.video-codec
        Media version    : 6.6.88
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.6.88
Interface Info:
        ID               : 0x0300000c
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : mtk-vcodec-dec-source
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Source
          Link 0x02000008: to remote pad 0x1000004 of entity 'mtk-vcodec-dec-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video3 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 15 Private Controls: 2
        Standard Compound Controls: 13 Private Compound Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK

Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0

scp upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/

Changes compared with v1:
--add v4l2-compliance test results
--add scp upstream link
--add HW difference discriptions for dt-bindings commit messages

This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/cover/20250510075357.11761-1-yunfei.dong@mediatek.com/
[2]
https://patchwork.linuxtv.org/project/linux-media/cover/20250528063633.14054-1-irui.wang@mediatek.com/

Kyrie Wu (8):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: add profile and level supporting for MT8189
  media: mediatek: vcodec: Add core-only VP9 decoding support for MT8189
  media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  2 ++
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  9 +++++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  4 +++
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 32 ++++++++++++-------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 14 ++++++++
 7 files changed, 50 insertions(+), 13 deletions(-)

-- 
2.46.0


