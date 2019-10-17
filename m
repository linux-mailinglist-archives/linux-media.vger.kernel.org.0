Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55547DA786
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408209AbfJQIkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:40:49 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:31106 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388788AbfJQIks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:40:48 -0400
X-UUID: be1c6daf401b476c93a7dceb163d73fa-20191017
X-UUID: be1c6daf401b476c93a7dceb163d73fa-20191017
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 645656944; Thu, 17 Oct 2019 16:40:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 16:40:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 17 Oct 2019 16:40:33 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 0/5] Add support for mt2701 JPEG ENC support
Date:   Thu, 17 Oct 2019 16:40:28 +0800
Message-ID: <20191017084033.28299-1-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset add support for mt2701 JPEG ENC support.

This is the compliance test result for jpeg dec and enc.

The JPEG dec log:                                           
------------------------------------------------------------
v4l2-compliance -d /dev/video0                                                     
v4l2-compliance SHA: b51e9a8a74eed6da15127fe5eadf515914347f76, 32 bits             
                                                                                   
Compliance test for mtk-jpeg device /dev/video0:                                   
                                                                                   
Driver Info:                                                                       
        Driver name      : mtk-jpeg                                                
        Card type        : mtk-jpeg decoder                                        
        Bus info         : platform:15004000.jpegdec                               
        Driver version   : 5.4.0                                                   
        Capabilities     : 0x84204000                                              
                Video Memory-to-Memory Multiplanar                                 
                Streaming                                                          
                Extended Pix Format                                                
                Device Capabilities                                                
        Device Caps      : 0x04204000                                              
                Video Memory-to-Memory Multiplanar                                 
                Streaming                                                          
                Extended Pix Format                                                
        Detected JPEG Decoder                                                      
                                                                                   
Required ioctls:                                                                   
        test VIDIOC_QUERYCAP: OK                                                   
                                                                                   
Allow for multiple opens:                                                          
        test second /dev/video0 open: OK                                           
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
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)                
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)                               
        Standard Controls: 0 Private Controls: 0                                   
                                                                                   
Format ioctls:                                                                     
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK                         
        test VIDIOC_G/S_PARM: OK (Not Supported)                                   
        test VIDIOC_G_FBUF: OK (Not Supported)                                     
        test VIDIOC_G_FMT: OK                                                      
        test VIDIOC_TRY_FMT: OK                                                    
        test VIDIOC_S_FMT: OK                                                      
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)                           
        test Cropping: OK                                                          
        test Composing: OK                                                         
        test Scaling: OK                                                           
                                                                                   
Codec ioctls:                                                                      
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                          
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                          
                                                                                   
Buffer ioctls:                                                                     
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                               
        test VIDIOC_EXPBUF: OK                                                     
        test Requests: OK (Not Supported)                                          
                                                                                   
Total for mtk-jpeg device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0   
------------------------------------------------------------

The JPEG enc log:

------------------------------------------------------------
v4l2-compliance -d /dev/video1 
v4l2-compliance SHA: b51e9a8a74eed6da15127fe5eadf515914347f76, 32 bits

Compliance test for mtk-jpeg device /dev/video1:

Driver Info:
        Driver name      : mtk-jpeg
        Card type        : mtk-jpeg encoder
        Bus info         : platform:1500a000.jpegenc
        Driver version   : 5.4.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected JPEG Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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
        Standard Controls: 4 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-jpeg device /dev/video1: 44, Succeeded: 44, Failed: 0, Warnings: 0
------------------------------------------------------------

Change compared to v3:
-put original v4l2-compliance bug fix in a separate patch.
-split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder, one
 for decoder.
-split mtk_jpeg_set_default_params() to two functions, one for encoder,
 one for decoder.
-add cropping support for encoder in g/s_selection ioctls.
-cancle v3 patch 'media:v4l2-ctrl: Add jpeg enc exif mode control',
 because that exif information can use V4L2_JPEG_ACTIVE_MARKER_APP1
 annotation: Exif metadata are restricted in size to 64kB in JPEG
 images because according to the specification this information be
 contained within a single JPEG APP1 segment (from wikipedia).
-change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 by
 specification.
-move width shifting operation behind aligning operation in
 mtk_jpeg_try_enc_fmt_mplane() for bug fix.
-fix user abuseing data_offset issue for DMABUF in
 mtk_jpeg_set_enc_src().
-fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGHT and
                     MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH from int
                     type to unsigned int type.
                     fix msleadingly indented of 'else'.

Xia Jiang (5):
  media: dt-bindings: Add jpeg enc device tree node document
  arm: dts: Add jpeg enc device tree node
  media: platform: Rename jpeg dec file name
  media: platform: Fix v4l2-compliance test bug
  media: platform: Add jpeg dec/enc feature

 .../bindings/media/mediatek-jpeg-encoder.txt  |  37 +
 arch/arm/boot/dts/mt2701.dtsi                 |  13 +
 drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 746 ++++++++++++++----
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
 .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |   2 +-
 .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |   9 +-
 ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
 ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
 .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |   0
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 ++++
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
 .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
 13 files changed, 1069 insertions(+), 154 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (99%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (91%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (100%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h

-- 
2.18.0



