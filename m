Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DAC255B0E
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbgH1NSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:18:37 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:33977 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbgH1NRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:17:46 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPA id D82D9FF80B;
        Fri, 28 Aug 2020 13:17:38 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org,
        wens@csie.org, yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 0/4] Support of MIPI CSI-2 for A83T
Date:   Fri, 28 Aug 2020 15:17:32 +0200
Message-Id: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds the support for the MIPI CSI-2 controller for the A83T SoC.
The CSI controller is the same as the V3s SoC that's why I put the A83T
MIPI CSI-2 driver in sun6i-csi.
My work is based on the Allwinner BSP for A83T and also on MIPI CSI-2
specification for the A83T given by Allwinner.

v4l2-compliance SHA: not available, 32 bits                                                                             
                                                                                                                        
Compliance test for sun6i-video device /dev/video0:                                                                     
                                                                                                                        
Driver Info:                                                                                                            
        Driver name      : sun6i-video                                                                                  
        Card type        : sun6i-csi                                                                                    
        Bus info         : platform:camera                                                                              
        Driver version   : 5.5.0                                                                                        
        Capabilities     : 0x84200001                                                                                   
                Video Capture                                                                                           
                Streaming                                                                                               
                Extended Pix Format                                                                                     
                Device Capabilities                                                                                     
        Device Caps      : 0x04200001                                                                                   
                Video Capture                                                                                           
                Streaming                                                                                               
                Extended Pix Format                                                                                     
Media Driver Info:                                                                                                      
        Driver name      : sun6i-csi                                                                                    
        Model            : Allwinner Video Capture Device                                                               
        Serial           :                                                                                              
        Bus info         :                                                                                              
        Media version    : 5.5.0                                                                                        
        Hardware revision: 0x00000000 (0)                                                                               
        Driver version   : 5.5.0                                                                                        
Interface Info:                                                                                                         
        ID               : 0x03000003                                                                                   
        Type             : V4L Video                                                                                    
Entity Info:                                                                                                            
        ID               : 0x00000001 (1)                                                                               
        Name             : sun6i-csi                                                                                    
        Function         : V4L2 I/O                                                                                     
        Pad 0x01000002   : 0: Sink, Must Connect                                                                        
          Link 0x02000007: from remote pad 0x1000006 of entity 'ov8865 1-0036': Data, Enabled, Immutable                
                                                                                                                        
Required ioctls:                                                                                                        
        test MC information (see 'Media Driver Info' above): OK                                                         
        test VIDIOC_QUERYCAP: OK                                                                                        
                                                                                                                        
Allow for multiple opens:                                                                                               
        test second /dev/video0 open: OK                                                                                
        test VIDIOC_QUERYCAP: OK                                                                                        
        test VIDIOC_G/S_PRIORITY: OK                                                                                    
        test for unlimited opens: OK                                                                                    
                                                                                                                        
Debug ioctls:                                                                                                           
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                
        test VIDIOC_LOG_STATUS: OK                                                                                      
                                                                                                                        
Input ioctls:                                                                                                           
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)                                                       
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)                                                                   
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)                                                                  
        test VIDIOC_ENUMAUDIO: OK (Not Supported)                                                                       
        test VIDIOC_G/S/ENUMINPUT: OK                                                                                   
        test VIDIOC_G/S_AUDIO: OK (Not Supported)                                                                       
        Inputs: 1 Audio Inputs: 0 Tuners: 0                                                                             
                                                                                                                        
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
                                                                                                                        
Control ioctls (Input 0):                                                                                               
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK                                                                        
        test VIDIOC_QUERYCTRL: OK                                                                                       
        test VIDIOC_G/S_CTRL: OK                                                                                        
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK                                                                               
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK                                                                     
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)                                                                    
        Standard Controls: 7 Private Controls: 0                                                                        
                                                                                                                        
Format ioctls (Input 0):                                                                                                
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK                                                              
        test VIDIOC_G/S_PARM: OK (Not Supported)                                                                        
        test VIDIOC_G_FBUF: OK (Not Supported)                                                                          
        test VIDIOC_G_FMT: OK                                                                                           
        test VIDIOC_TRY_FMT: OK                                                                                         
        test VIDIOC_S_FMT: OK                                                                                           
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)                                                                
        test Cropping: OK (Not Supported)                                                                               
        test Composing: OK (Not Supported)                                                                              
        test Scaling: OK                                                                                                
                                                                                                                        
Codec ioctls (Input 0):                                                                                                 
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                               
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                     
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                               
                                                                                                                        
Buffer ioctls (Input 0):                                                                                                
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                    
        test VIDIOC_EXPBUF: OK                                                                                          
        test Requests: OK (Not Supported)                                                                               
                                                                                                                        
Total for sun6i-video device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

Changes since V1:
- Add more details in the cover letter.
- Add a test to get the clocks to avoid an error for the platform without MIPI
CSI-2.
- Add more details in the register assignations.
- Removed the support of multiple virtual channels because there is only one
channel support in the CSI driver.

Kévin L'hôpital (4):
  media: sun6i-csi: Fix the bpp for 10-bit bayer formats
  media: sunxi: sun6i-csi: Move the sun6i_csi_dev structure to the
    common header
  media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
  ARM: dts: sun8i: a83t: Add support for the MIPI CSI-2 in CSI node

 arch/arm/boot/dts/sun8i-a83t.dtsi             |  11 +-
 .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  96 +++++---
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  14 +-
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.c         |  39 ++++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.h         |  16 ++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h     |  39 ++++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c    | 217 ++++++++++++++++++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h    |  16 ++
 .../sun6i-csi/sun8i_a83t_mipi_csi2_reg.h      | 179 +++++++++++++++
 10 files changed, 595 insertions(+), 34 deletions(-)
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h

-- 
2.17.1

