Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252731857CD
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 02:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgCOBq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Mar 2020 21:46:27 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4217 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgCOBqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Mar 2020 21:46:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e6d88ad0000>; Sat, 14 Mar 2020 18:45:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 14 Mar 2020 18:46:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 14 Mar 2020 18:46:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 15 Mar
 2020 01:46:04 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 15 Mar 2020 01:46:04 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.141]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e6d88db0000>; Sat, 14 Mar 2020 18:46:03 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 0/8] Add Tegra driver for video capture
Date:   Sat, 14 Mar 2020 18:45:58 -0700
Message-ID: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584236717; bh=OTbxEc+qJ5RmkKZRiBJqkQjJWytmzFQlHvX1N7Jdb3E=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=aoIQdLKa6dchVAn8iBbZ5nsT49SyDzOrV5qe1pqypOzvFDgL7KnY0BSET/He/rjYP
         y/nJcNS38qQDsqCdHWZCCXfSAt9YPlKJ8kGCS5X+4iIrwhY0oqbsL7I05vmurtZio/
         nNyaCjMpY1+PZBVAo753j2VcgBxfEb4X+BtQap07KfXR+qVaCYRaadvYmBUyG5u6BN
         JRWs59BQ7IPy2FpMrwLS/UZjMPVL3mpNkWiBG3NRE2n713f4+fAFup+itdrpBt86vw
         3KSXa58xeGj2MLH4Zp48jdT1I9CQkh6xSoNrDim/JEr0X7PjF623amJPouVurDgg5c
         tDYYl/nyu8kGQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds Tegra210 VI and CSI driver for built-in test pattern
generator (TPG) capture.

Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
CSI port is one-to-one mapped to VI channel for video capture.

This series has TPG support only where it creates hard media links
between CSI subdevice and VI video device without device graphs.

v4l2-compliance results are available below the patch diff.

[v4]:	Includes,
	- v3 feedback changes and some improvements
	- Fixes tegra_channel_buffer struct to use v4l2 buffer as first
	  member. This also fixes crash of unable to handle kernel write
	  to read-only memory.
	- Uses separate host1x sync ids for frame start and memory write
	  ack as single sync id for both can cause sync loss between exact
	  frame start and memory write ack events.
	- Uses client managed host1x syncpoints.
	- Includes fix to increment syncpoint counter to match cached value
	  to synchronize in case of timeouts or missed hardware triggers.
	- Frame start and memory write ack syncpoint FIFO's are of size 2.
	  So, updated capture logic to avoid adding more than 2 sync point
	  condition requests to FIFOs to avoid overflow.
	- Implemented PM ops for runtime suspend and resume along with generic
	  power domains to allow proper power gate and ungate sequencing along
	  with MC VI flush during power gate.
	- Fixed Tegra210 device tree sor power domain clocks.
	- Added missing reset-cells to mc node.

[v3]:	Includes,
	- video device node handling set/get formats of all devices
	  in the pipeline.
	- Removed subdev nodes.
	- Fixed frame sync timeout issue due to CSI clocks not properly
	  set for corresponding blocks.
	- uses minimum 3 buffers to be queued to fixed memory race between
	  DMA writes and userspace reads causing kernel hang reporting
	  kernel write to read-only memory.
	- Improved capture threads and done threads to avoid possible
	  race conditions and added recovery incase of frame sync timeout.
	- Passes all the V4L compliance tests.

[v2]:	Includes,
	- v0 feedback
	- Merged files to have Tegra specific separately
	- Moved CSI device as child to VI as Tegra210 CSI is
	  part of VI sharing same host interface and register
	  space.
	- Added link_validate for format validation.
	- Fixes for passing v4l2-compliance for media, video,
	  and subdevices.

[v1]:	Includes,
	- Adds CSI TPG clock to Tegra210 clock driver
	- Host1x video driver with VI and CSI clients.
	- Support for Tegra210 only.
	- VI CSI TPG support with hard media links in driver.
	- Video formats supported by Tegra210 VI
	- CSI TPG supported video formats


Sowjanya Komatineni (8):
  arm64: tegra: Fix sor powergate clocks and reset
  arm64: tegra: Add reset-cells to mc
  dt-bindings: clock: tegra: Add clk id for CSI TPG clock
  clk: tegra: Add Tegra210 CSI TPG clock gate
  dt-binding: tegra: Add VI and CSI bindings
  media: tegra: Add Tegra210 Video input driver
  MAINTAINERS: Add Tegra Video driver section
  arm64: tegra: Add Tegra VI CSI support in device tree

 .../display/tegra/nvidia,tegra20-host1x.txt        |   67 +-
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   51 +-
 drivers/clk/tegra/clk-tegra210.c                   |    7 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/tegra/Kconfig                |   10 +
 drivers/staging/media/tegra/Makefile               |    8 +
 drivers/staging/media/tegra/TODO                   |   10 +
 drivers/staging/media/tegra/tegra-common.h         |  263 +++++
 drivers/staging/media/tegra/tegra-csi.c            |  533 ++++++++++
 drivers/staging/media/tegra/tegra-csi.h            |  118 +++
 drivers/staging/media/tegra/tegra-vi.c             | 1060 ++++++++++++++++++++
 drivers/staging/media/tegra/tegra-vi.h             |   83 ++
 drivers/staging/media/tegra/tegra-video.c          |  129 +++
 drivers/staging/media/tegra/tegra-video.h          |   32 +
 drivers/staging/media/tegra/tegra210.c             |  754 ++++++++++++++
 drivers/staging/media/tegra/tegra210.h             |  192 ++++
 include/dt-bindings/clock/tegra210-car.h           |    2 +-
 20 files changed, 3325 insertions(+), 17 deletions(-)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/tegra-common.h
 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
 create mode 100644 drivers/staging/media/tegra/tegra-video.c
 create mode 100644 drivers/staging/media/tegra/tegra-video.h
 create mode 100644 drivers/staging/media/tegra/tegra210.c
 create mode 100644 drivers/staging/media/tegra/tegra210.h


v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits, 32-bit time_t                                                                                    
                                                                                                                                                                         
Compliance test for tegra-video device /dev/media0:                                                                                                                      
                                                                                                                                                                         
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MEDIA_IOC_DEVICE_INFO: OK                                                                                                                                   
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/media0 open: OK                                                                                                                                 
        test MEDIA_IOC_DEVICE_INFO: OK                                                                                                                                   
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
Media Controller ioctls:                                                                                                                                                 
        test MEDIA_IOC_G_TOPOLOGY: OK                                                                                                                                    
        Entities: 12 Interfaces: 6 Pads: 12 Links: 12                                                                                                                    
        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK                                                                                                                           
        test MEDIA_IOC_SETUP_LINK: OK                                                                                                                                    
        test invalid ioctls: OK                                                                                                                                          
                                                                                                                                                                         
Total for tegra-video device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0                                                                                        
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video0:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-0                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x03000003                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x00000001 (1)                                                                                                                                
        Name             : 54080000.vi-output-0                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x01000002   : 0: Sink                                                                                                                                       
          Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-0': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video0 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video1:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-1                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x03000007                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x00000005 (5)                                                                                                                                
        Name             : 54080000.vi-output-1                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x01000006   : 0: Sink                                                                                                                                       
          Link 0x0200001f: from remote pad 0x100001e of entity 'tpg-1': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video1 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video1: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video2:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-2                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x0300000b                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x00000009 (9)                                                                                                                                
        Name             : 54080000.vi-output-2                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x0100000a   : 0: Sink                                                                                                                                       
          Link 0x02000023: from remote pad 0x1000022 of entity 'tpg-2': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video2 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video2: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video3:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-3                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x0300000f                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x0000000d (13)                                                                                                                               
        Name             : 54080000.vi-output-3                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x0100000e   : 0: Sink                                                                                                                                       
          Link 0x02000027: from remote pad 0x1000026 of entity 'tpg-3': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video3 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video3: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video4:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-4                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x03000013                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x00000011 (17)                                                                                                                               
        Name             : 54080000.vi-output-4                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x01000012   : 0: Sink                                                                                                                                       
          Link 0x0200002b: from remote pad 0x100002a of entity 'tpg-4': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video4 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video4: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
--------------------------------------------------------------------------------                                                                                         
Compliance test for tegra-video device /dev/video5:                                                                                                                      
                                                                                                                                                                         
Driver Info:                                                                                                                                                             
        Driver name      : tegra-video                                                                                                                                   
        Card type        : 54080000.vi-output-5                                                                                                                          
        Bus info         : platform:54080000.vi                                                                                                                          
        Driver version   : 5.6.0                                                                                                                                         
        Capabilities     : 0x85200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
                Device Capabilities                                                                                                                                      
        Device Caps      : 0x05200001                                                                                                                                    
                Video Capture                                                                                                                                            
                Read/Write                                                                                                                                               
                Streaming                                                                                                                                                
                Extended Pix Format                                                                                                                                      
Media Driver Info:                                                                                                                                                       
        Driver name      : tegra-video                                                                                                                                   
        Model            : NVIDIA Tegra Video Input Device                                                                                                               
        Serial           :                                                                                                                                               
        Bus info         : platform:54080000.vi                                                                                                                          
        Media version    : 5.6.0                                                                                                                                         
        Hardware revision: 0x00000003 (3)                                                                                                                                
        Driver version   : 5.6.0                                                                                                                                         
Interface Info:                                                                                                                                                          
        ID               : 0x03000017                                                                                                                                    
        Type             : V4L Video                                                                                                                                     
Entity Info:                                                                                                                                                             
        ID               : 0x00000015 (21)                                                                                                                               
        Name             : 54080000.vi-output-5                                                                                                                          
        Function         : V4L2 I/O                                                                                                                                      
        Pad 0x01000016   : 0: Sink                                                                                                                                       
          Link 0x0200002f: from remote pad 0x100002e of entity 'tpg-5': Data, Enabled                                                                                    
                                                                                                                                                                         
Required ioctls:                                                                                                                                                         
        test MC information (see 'Media Driver Info' above): OK                                                                                                          
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
                                                                                                                                                                         
Allow for multiple opens:                                                                                                                                                
        test second /dev/video5 open: OK                                                                                                                                 
        test VIDIOC_QUERYCAP: OK                                                                                                                                         
        test VIDIOC_G/S_PRIORITY: OK                                                                                                                                     
        test for unlimited opens: OK                                                                                                                                     
                                                                                                                                                                         
        test invalid ioctls: OK                                                                                                                                          
Debug ioctls:                                                                                                                                                            
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)                                                                                                                 
        test VIDIOC_LOG_STATUS: OK (Not Supported)                                                                                                                       
                                                                                                                                                                         
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
        Standard Controls: 2 Private Controls: 0                                                                                                                         
                                                                                                                                                                         
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
        test Scaling: OK (Not Supported)                                                                                                                                 
                                                                                                                                                                         
Codec ioctls (Input 0):                                                                                                                                                  
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)                                                                                                                
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)                                                                                                                      
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)                                                                                                                
                                                                                                                                                                         
Buffer ioctls (Input 0):                                                                                                                                                 
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK                                                                                                                     
        test VIDIOC_EXPBUF: OK                                                                                                                                           
        test Requests: OK (Not Supported)                                                                                                                                
                                                                                                                                                                         
Test input 0:                                                                                                                                                            
                                                                                                                                                                         
Streaming ioctls:                                                                                                                                                        
        test read/write: OK                                                                                                                                              
        test blocking wait: OK                                                                                                                                           
        test MMAP (no poll): OK                                                                                                                                          
        test MMAP (select): OK                                                                                                                                           
        test MMAP (epoll): OK                                                                                                                                            
        test USERPTR (no poll): OK (Not Supported)                                                                                                                       
        test USERPTR (select): OK (Not Supported)                                                                                                                        
        test DMABUF: Cannot test, specify --expbuf-device                                                                                                                
                                                                                                                                                                         
Total for tegra-video device /dev/video5: 53, Succeeded: 53, Failed: 0, Warnings: 0                                                                                      
                                                                                                                                                                         
Grand Total for tegra-video device /dev/media0: 326, Succeeded: 326, Failed: 0, Warnings: 0                                                                              

-- 
2.7.4

