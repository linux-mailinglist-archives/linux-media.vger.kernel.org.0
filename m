Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8222DA4C4
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 01:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgLOAZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 19:25:16 -0500
Received: from mail-bn8nam11on2053.outbound.protection.outlook.com ([40.107.236.53]:42717
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728452AbgLOAZO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 19:25:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEgxjDxMq6+YFQM7msVc8mE8u0s4JoNB7XIcaQX7M+HnhEv0YajYA3JvFGF/XYMOcHU+Hw3Kk+hBjsCypQ8Yozu/TkodZoBjqbPfSmpFSkgOaYNsxQhTB71MVBrxP76wE1G81PYgzpvY4DFrq4dkM9niWSzkVC9QR/kTvg6hyRBSuIScEZJOPVzFjw4001IFyKGDT/Qkw7bKUHKza0JlrGiWAP7cP/PGcw2idufwurSRyvutuS5iK7h/Uyk/y2QIs8/S7wP7EiE0NKp+EQUKlwWfV4C3ZogT7VFyDQ/FibcHO0Ud08jvT3N70DC6mVvCkRCpwKmIUBYz5V+8MZgsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu+T0Id7xdQByco2gnZUFIwBc2fvhSJ8dzB42kRho1E=;
 b=ZrFGEujDCt8AV6MlaEKxWD8YDEnJiS9Zzp+6O71rfSfB0S7yvyW+QPsMLl++43OhXcqJSHPG4jXeYvaVroA27T++8mbAh1yJqoMWpugBDSYsL+iMJmPRr3aQCKPJIm+72roo4AXUBDE1fHCn8Uk6VwpdXD0gj5UsuO1cXTxJOECA0KI5Qo/3a2LRgspFZ+wTuToZinmyn3iowQqICneJmTSY95nKHoZR+3UtZkXMqhmUpFw4kONTo4fXedDojgGO551iM63Xtr/oC6H+ueDUcxMMGQiEWWHmwRMLcliqBwKVrVtRZCpgFIf6gP6BXZvK1SdOcU/U7ICHSCxjp7xa4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu+T0Id7xdQByco2gnZUFIwBc2fvhSJ8dzB42kRho1E=;
 b=q6zFZqxwe0mX0kvy9m8Am8N31H3TR3Hm3Snl1F0wdSM1LaE78fRQUXz9Ttzth2KH3ySuodUbpsSx9MlwJpJ7BG9H6SigMbi3pXesxQdZbsq339JG8VdtDjSK9SB4aEn4Ild48fkEA6LXyxSywHahJ1TFStLuNCKSzBOg+QuZJA0=
Received: from SA9PR13CA0166.namprd13.prod.outlook.com (2603:10b6:806:28::21)
 by BN8PR02MB5763.namprd02.prod.outlook.com (2603:10b6:408:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 00:24:20 +0000
Received: from SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:28:cafe::e8) by SA9PR13CA0166.outlook.office365.com
 (2603:10b6:806:28::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend
 Transport; Tue, 15 Dec 2020 00:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT034.mail.protection.outlook.com (10.152.72.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 00:24:19 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 14 Dec 2020 16:24:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 14 Dec 2020 16:24:18 -0800
Envelope-to: derek.kiernan@xilinx.com,
 manish.narani@xilinx.com,
 michal.simek@xilinx.com,
 dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com,
 ravi.patel@xilinx.com,
 tejas.patel@xilinx.com,
 wendy.liang@xilinx.com,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org,
 arnd@arndb.de,
 alexdeucher@gmail.com,
 daniel@ffwll.ch
Received: from [10.23.125.52] (port=53923)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <wendy.liang@xilinx.com>)
        id 1koy8Y-0005wY-Lf; Mon, 14 Dec 2020 16:24:18 -0800
From:   Jiaying Liang <wendy.liang@xilinx.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To:     Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Wendy Liang <wendy.liang@xilinx.com>, <tejas.patel@xilinx.com>,
        <ravi.patel@xilinx.com>, <rajan.vaja@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        devicetree <devicetree@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>, <manish.narani@xilinx.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Christian Koenig <christian.koenig@amd.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
 <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
Message-ID: <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
Date:   Mon, 14 Dec 2020 16:24:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fb42bfb-9cd9-43c4-22c7-08d8a08fc3a9
X-MS-TrafficTypeDiagnostic: BN8PR02MB5763:
X-Microsoft-Antispam-PRVS: <BN8PR02MB5763382DA04D05F416C03B9EB0C60@BN8PR02MB5763.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8L1kq1+yusDeoymrPC/RArEGZxSGACP2z+FwVE6c+qBZmYWWTR2j2Nf5GUmNXbct0XC0CbEJHOpQSFUe/EVu7X8t5hzpNrdMrkVTFC1y0p5+cRAvlGpTs3sL+820kReeaGinB9nPA9S8hXR1rbbQhU1y4PCzpFjTPt7bh/kmmYb8szT9yo8cjlMPJBwrh2AiUCDCWJBvbuz+yt/w+/ZQdpRp7m1Jc4GF0u2HHFdPpA94Yy4eWKPQe7hPASj6X5RjzXdpYdC3V//qxdaffL7ORnZMFdsSj4h0LGs0JIlxuHcfY/7QycwxIAFIBFpzjCktFN/wKLH0Htero96f8P1tqbRLDTtGqwbS0UHKbgIkU+eMnHRc6ZhReXHzPBt48Y7kOULJ26DLezwgzm0k8YiHDn9Hph1Kb814Ramgma0Twdlj+LseIrg06+wQV+J43SF+F3nrLLLzy0JQYMcDprdBmfkXtvjbNVo3/isvLwAM5o+Ew/kve90v/DOyG3PE6gqrGXLlirSqfNJ7MGLsmY1Dg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(46966005)(36906005)(356005)(54906003)(82310400003)(47076004)(8936002)(110136005)(31696002)(2906002)(508600001)(30864003)(7416002)(966005)(8676002)(53546011)(26005)(31686004)(186003)(4326008)(5660300002)(70586007)(7636003)(70206006)(9786002)(83380400001)(36756003)(2616005)(426003)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 00:24:19.5524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb42bfb-9cd9-43c4-22c7-08d8a08fc3a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5763
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 12/11/20 11:39 AM, Daniel Vetter wrote:
> Hi all
>
> On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher<alexdeucher@gmail.com>  wrote:
>> On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang<wendy.liang@xilinx.com>  wrote:
>>> AI engine is the acceleration engine provided by Xilinx. These engines
>>> provide high compute density for vector-based algorithms, and flexible
>>> custom compute and data movement. It has core tiles for compute and
>>> shim tiles to interface the FPGA fabric.
>>>
>>> You can check the AI engine architecture document for more hardware details:
>>> https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
>>>
>>> This patch series adds a Linux kernel driver to manage the Xilinx AI
>>> engine array device and AI engine partitions (groups of AI engine tiles
>>> dedicated to an application).
>> Hi Wendy,
>>
>> I think it would be good to provide an overview of how your stack
>> works in general.  That would give reviewers a better handle on how
>> all of this fits together.  I'd suggest including an overview in the
>> cover letter and also in the commit message and/or as a comment in the
>> code in one of the patches.  I'm not really an expert when it comes to
>> FPGAs, but this basically looks like a pretty low level interface to
>> set up the data fabric for a kernel that will run on the soft logic or
>> maybe the microcontroller on the board.  It doesn't have to be super
>> detailed, just a nice flow for how you might use this.  E.g.,
>>
>> Userspace uses ioctls X, Y, Z to configure the data fabric for the
>> FPGA kernel.  The kernels can run on... .  DMA access to system memory
>> for data sets can be allocated using ioctl A.  DMA access is limited
>> by... . The user can then load the FPGA kernel on to one of the
>> engines using ioctl B and finally they can kick off the whole thing
>> using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
>> use the following runtime (link to runtime) to configure the data
>> fabric using ioctls X, Y, Z.
> At least for drm drivers we ideally have that as a .rst file in
> Documentation/. With that you can even do full svg graphs, or just dot
> graphs, of the overall stack if you really want to go overboard :-)
>
>> It would also be good to go over the security implications of the
>> design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
>> or is it limited to just the DMA regions set up by the ioctls?  Also,
>> does the hardware and software design allow for multiple users?  If
>> so, how does that work?
> I've also seen indications that there's some on-chip or on-card
> memory. How that's planned to be used and whether we want to manage
> this (maybe even with something like ttm) would be good to understand.
>
> All excellent questions from Alex, just figured I add some more.
>
> Cheers, Daniel

Hi Alex, Daniel,

Below is an overview of the driver.

AI engine kernel driver manages Xilinx AI engine device. An AI engine device
contains cores tiles and SHIM tiles. Core tiles are the computation tiles
, the SHIM tiles are the tiles interfacing to external components.

           +--------+--------+--------+--------+
            | Core        | Core        | Core        | Core | ...
            |                |                | |                |
           +-----------------------------------+
            | Core        | Core        | Core        | Core     | ...
            |                |                | |             |
           +--------+--------+--------+---------
            ...
           +--------+--------+-----------------+
           | SHIM        | SHIM       | SHIM       |SHIM        |
           | PL            | PL           | PL            |PL | NOC  |
           +---+----+---+----+---+-----+-------+
   AXI Streams   |        |                |              |    |AXI MM
                        |        |                | |    |
Events Singals |        |                |              |    |
                        |        |                | |    |
                        |        |                | |    |
           +---+--------+--------+-----+ +--+------+
           |       FPGA                                        | |   
NOC        |
           | | |                  |
           +---------------------------+ +--+-------+
                                            |
                                            |
                                        +---+------+
                                        |   DDR           |
                                        +----------+

Each Core tile contains computing module, local memory and DMA module. The
local memory DMA module takes data from or to the AXI streams and writes
it to or reads it from the local memory. The computing module can also
directly get/put data from/to the AXI stream. The AIE SHIM enables AIE tiles
to get/put data from/to AXI streams from FPGA, enables external master to
access AI engine address space through AXI MM. SHIM NoC module has DMA 
engine,
which can access extern memory though AXI MM and push it to internal AXI
streams.

At runtime, the AI engine tiles interconnection needs to be configured 
so that
it can get fetch data from external components or adjacent tiles, and AI 
engine
core program needs to be loaded. And then user application can push data 
to the
AI engine array and start/stop AI engine core. AI engine device errors 
can be
raised as events, the AI engine kernel driver listens to the events 
interrupt
to monitor runtime async device errors.

Instead of application directly interacting with the AI engine kernel 
APIs, user
application/libraries interacts with AI engine userspace library:
https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/aienginev2
It provides cross OSes low level functional abstraction such as how to 
connect one
stream port to another stream port, how to configure core tile local DMA.

The AI engine library can be used by other runtime libraries such as 
Xilinx runtime (XRT)
library: https://xilinx.github.io/XRT/master/html/index.html,
which provides acceleration abstraction for Xilinx accelerators, it has 
extensions
to interface to other acceleration framework such as OpenCL.
XRT provides buffer handling abstractions for user application to share 
data between
applicaiton and devices.

Here is an example of application runtime stack:

             +----------------------------+
             |      Application                              |
             | |
             +----------------------------+
             |       XRT                                        |
             | |
             +----------------------------+
             |      AIE Library                               |
             | |
            +----------------------------+
     +----------------------------------------+
Kern    +----------------------------+
             |         AIE Partition                        +--+
            +----------------------------+    |
                   |----------------------------+
             +----------------------------+
              |         AIE Device                           |
              | |
             +----------------------------+



The AI engine kernel driver provides the following user interfaces:
  * AIE device driver is the root device driver to manage the partitions of
    of the AI engine device array. AI engine array can be partitioned into
    column wised isolated partitions. Each applicaiton can only access its
    own partitions.
  * AIE device driver monitors the interrupt from the AI enigne device. All
    AI engine tiles shared the same interrupt for error events.
  * AIE partition driver controls address mapping and access of the
    registers/local memories of the tiles within a partition.
    * It provides mmap operation to enable application to direclty 
access the
      tiles local memories for small data update such as parameter 
update for
      performance.
    * It provides mmap operatio to map all the registers as readonly for
      application to poll registers efficiently to check status.
    * It provides ioctl for userspace to pass I/O commands to write/mask 
write
      the registers. How to configure is defined by userspace. Userspace 
will
      pass the I/O commands sequence to the kernel driver, and kernel driver
      will validate the commands before it writes to the registers.
    * It provides ioctl to import dmabuf and ioctl to configure the the 
DMA module
      in the SHIM tile which can access memory outside AI engine array.

The buffer management is out of this driver. In the above example, user 
application
uses Xilinx runtime(XRT), XRT is the one to manage the buffers.


Best Regards,

Wendy

>
>> Thanks,
>>
>> Alex
>>
>>
>>> v3:
>>> * unlock AIE dev mutex after failed to gain the partition lock in
>>>    errors handing
>>> * replace pointer with __u64 and enum with __u32 in ioctl
>>>
>>> v2:
>>> * Fix dtschema check errors
>>> * Fix test bot warning on interrupt implementation. Removed set but
>>>    unused  varaible.
>>> * Fix compilation unused function warning of firmware change in case
>>>    ZynqMP firmware is not configured
>>> * There are other warning on ZynqMP firmware reported from testbot
>>>    which is not introduced by this patch set.
>>>    "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
>>>    for those fixes.
>>>
>>>
>>> Izhar Ameer Shaikh (1):
>>>    firmware: xilinx: Add IOCTL support for AIE ISR Clear
>>>
>>> Nishad Saraf (2):
>>>    misc: xilinx-ai-engine: Add support to request device management
>>>      services
>>>    misc: xilinx-ai-engine: Add support for servicing error interrupts
>>>
>>> Wendy Liang (6):
>>>    dt-binding: soc: xilinx: ai-engine: Add AI engine binding
>>>    misc: Add Xilinx AI engine device driver
>>>    misc: xilinx-ai-engine: Implement AI engine cleanup sequence
>>>    misc: xilinx-ai-engine: expose AI engine tile memories to userspace
>>>    misc: xilinx-ai-engine: add setting shim dma bd operation
>>>    misc: xilinx-ai-engine: add request and release tiles
>>>
>>>   .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
>>>   MAINTAINERS                                        |   8 +
>>>   drivers/firmware/xilinx/zynqmp.c                   |  14 +
>>>   drivers/misc/Kconfig                               |  12 +
>>>   drivers/misc/Makefile                              |   1 +
>>>   drivers/misc/xilinx-ai-engine/Makefile             |  16 +
>>>   drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
>>>   .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
>>>   drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
>>>   include/linux/firmware/xlnx-zynqmp.h               |   8 +
>>>   include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
>>>   18 files changed, 4719 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
>>>   create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
>>>   create mode 100644 include/uapi/linux/xlnx-ai-engine.h
>>>
>>> --
>>> 2.7.4
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
