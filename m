Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297C81C4C18
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgEECbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:31:09 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10281 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgEECbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 22:31:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb0cfa10002>; Mon, 04 May 2020 19:29:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 19:31:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 04 May 2020 19:31:03 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 02:31:02 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 5 May 2020 02:31:02 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.119]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb0cfe40000>; Mon, 04 May 2020 19:31:01 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v12 0/9] Add Tegra driver for video capture
Date:   Mon, 4 May 2020 19:31:51 -0700
Message-ID: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588645793; bh=MNxFcpFMYtH1gBNA/dfb9VouOqpSSnRdywHCKQbSwBQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=PQKYIdcUOUHUxVaiBBxrrHnsNkgbW47suDP6/8Kj/7E0KNCvkb0rZX37lu9s4jGug
         cjU5UXIJqs7na1Cpuq9Xfuki/mExNBJVyRfl2SLuCrJImPypa/Y9MTuY4xeTxjZk4i
         92vboGu4AGEYqYM38cpPbyNojKG8TC0OGQBMSSDBYZECSMIoJrQcSjX+Zzrj3FIpU6
         fbchc8DeeyJF6QT9xUE0x60hEbGTGhmbTvvjTo8PQf2KXZ740TbqAtwSGDU0gnXp25
         6Ay0RHsFWZEiIRWPm9AzZYy0P2PhyB+Ldlv4b0Mj9ODrVGcqF8uVCnaQHpc56lLmKD
         yb339Ybv0K3qQ==
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

[v12]:	Includes,
	- v12 feedback
	- module.h got removed in v11 accidentally. Fixed it.
	- Removed freezable kthreads as we don't need them.
	- Patches rebased on latest linux-next

[v11]:  Includes,
	- v10 feedback

[v10]:	Includes,
	- updated patches for latest linux-next base
	- Kconfig update
	- minor cleanup/improvements

[v9]:	Includes,
	- small fix to explicitly check for both vi and csi channels
	  availability before TPG setup and cleanup so in the cases
	  of later Tegras where CSI is not child to VI and if either
	  of the platform drivers are not registered, TPG setup will be
	  skipped.

[v8]:	Includes,
	- minor change to use device managed allocation fo vi and csi for now.
	  May need to change back to non device managed allocation later when
	  support for direct host1x client driver unbind and bind is added.

[v7]:	Includes,
	- v6 feedback
	- moved registering v4l2 nodes and creating tpg media links to happen
	  after both host1x client inits so during direct host1x client driver
	  unbind and bind order of client unregister/register will not impact.
	- All channels resources and freeing happens during v4l2 device release
	  callback.
	- module unload/load works with below host1x bus driver fix.
	  http://patchwork.ozlabs.org/patch/1268191/

[v6]:	Includes,
	- v5 feedback
	- fix for csi_tpg clock parent
	- fix to free channel resources in video device release callback
	  for registered video devices as resource might still be in use
	  when application holds handle to it during driver unbind.
	- added blanking intervals based on resolution and bpp for csi
	  internal tpg.
	- added implementation for subdev pad ops enum_frame_size and
	  enum_frame_interval.

[v5]:	Includes,
	- v4 feedback
	- fix for venc powergate mc reset order.
	- fix to have unbind and bind work during v4l2-ctl sleep and streaming.

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
	  race conditions and added recovery in case of frame sync timeout.
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


Sowjanya Komatineni (9):
  arm64: tegra: Fix sor powergate clocks and reset
  arm64: tegra: Add reset-cells to mc
  dt-bindings: clock: tegra: Add clk id for CSI TPG clock
  clk: tegra: Add Tegra210 CSI TPG clock gate
  dt-binding: tegra: Add VI and CSI bindings
  media: tegra: Add Tegra210 Video input driver
  MAINTAINERS: Add Tegra Video driver section
  dt-bindings: reset: Add ID for Tegra210 VI reset
  arm64: tegra: Add Tegra VI CSI support in device tree

 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   52 +-
 drivers/clk/tegra/clk-tegra210.c                   |    7 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/tegra-video/Kconfig          |   12 +
 drivers/staging/media/tegra-video/Makefile         |    8 +
 drivers/staging/media/tegra-video/TODO             |   11 +
 drivers/staging/media/tegra-video/csi.c            |  539 ++++++++++
 drivers/staging/media/tegra-video/csi.h            |  147 +++
 drivers/staging/media/tegra-video/tegra210.c       |  978 ++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c             | 1074 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h             |  257 +++++
 drivers/staging/media/tegra-video/video.c          |  155 +++
 drivers/staging/media/tegra-video/video.h          |   29 +
 include/dt-bindings/clock/tegra210-car.h           |    2 +-
 include/dt-bindings/reset/tegra210-car.h           |    1 +
 19 files changed, 3351 insertions(+), 17 deletions(-)
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h


v4l2-compliance SHA: 81e45d957c4db39397f893100b3d2729ef39b052, 32 bits, 32-bit time_t

Compliance test for tegra-video device /dev/media0:

Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.7.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.7.0

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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x03000005                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x00000003 (3)                                                           
        Name             : 54080000.vi-output-0                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x01000004   : 0: Sink                                                                  
          Link 0x02000007: from remote pad 0x1000002 of entity 'tpg-0': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x0300000d                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x0000000b (11)                                                          
        Name             : 54080000.vi-output-1                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x0100000c   : 0: Sink                                                                  
          Link 0x0200000f: from remote pad 0x100000a of entity 'tpg-1': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x03000015                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x00000013 (19)                                                          
        Name             : 54080000.vi-output-2                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x01000014   : 0: Sink                                                                  
          Link 0x02000017: from remote pad 0x1000012 of entity 'tpg-2': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x0300001d                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x0000001b (27)                                                          
        Name             : 54080000.vi-output-3                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x0100001c   : 0: Sink                                                                  
          Link 0x0200001f: from remote pad 0x100001a of entity 'tpg-3': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x03000025                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x00000023 (35)                                                          
        Name             : 54080000.vi-output-4                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x01000024   : 0: Sink                                                                  
          Link 0x02000027: from remote pad 0x1000022 of entity 'tpg-4': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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
        Driver version   : 5.7.0                                                                    
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
        Media version    : 5.7.0                                                                    
        Hardware revision: 0x00000003 (3)                                                           
        Driver version   : 5.7.0                                                                    
Interface Info:                                                                                     
        ID               : 0x0300002d                                                               
        Type             : V4L Video                                                                
Entity Info:                                                                                        
        ID               : 0x0000002b (43)                                                          
        Name             : 54080000.vi-output-5                                                     
        Function         : V4L2 I/O                                                                 
        Pad 0x0100002c   : 0: Sink                                                                  
          Link 0x0200002f: from remote pad 0x100002a of entity 'tpg-5': Data, Enabled               
                                                                                                    
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
        test VIDIOC_G/S_PARM: OK                                                                    
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

