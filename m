Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E813A7E59D4
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 16:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjKHPPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 10:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjKHPPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 10:15:16 -0500
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2EE1990
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 07:15:13 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mx.kolabnow.com (Postfix) with ESMTP id 85ABF20E15CD;
        Wed,  8 Nov 2023 16:15:11 +0100 (CET)
Authentication-Results: ext-mx-out011.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :from:from:content-language:references:subject:subject
        :mime-version:date:date:message-id:received:received:received;
         s=dkim20160331; t=1699456510; x=1701270911; bh=DaJOWaGJckORUtRD
        xv0Ng+hit5G9TireSYzv/0O4J+M=; b=cIUGdQPu2BZsGFi8TdILU4Q/Wqs2RiUt
        YZNPjJQBra0thlIuBZfXgpSd8xzu0GwwIH4fMVb2w3L/Dd1rOWwD/iqX6B0Xc3LZ
        1xF0cUw1/h+YA/FvgeM3O20ax21akNCwjUCvxiQaBuy++qzD+3gU+81s1JcNE8JV
        uOpjLdO5iCcJYV0OLMZsAgYindaKgX1XXl/v87uSfhBxliYf0YdMjjYGplPG5NIf
        niO3tc5NWyBFXdez24YMFd4c0oXEWgAobK7F+Z4a7DasM8FXa9UbFbO0vAKkCg15
        df1gSUPFmD4cvx0Kff05F7oyiTQQRsWIC4MFGCjs8b8vD2fbpX/0LreiKc76T5Ws
        souKl1jhnFP5rLX/DPhMQXsC2U8nfnxVGlPPqzb6W6E2nkPPDvSpUwImzjgPEuEG
        cme1mT+TWNt/G4WDKB7qYiKpEM1MOkS62XOY+qEBRSVGelz3Ovi7443Rp11QuOKy
        bW+eNPBNXA/xAGNAey9P++biHMoqLyazevcF6XqyynCzz5D2vhhp9HD+OGXmvtOQ
        +eOu0JW7+0cocBNs1Wk10buNpCmqraIUeTZsnRg6vOI9GUY4hvM/ETAEl49SmK3y
        715X9KDTcuce/fqw3/tw+DGtagh+7MxBqyDEdr1l07fwbPXiRHVliJATVvJRXiUm
        M/qDi4TSqNE=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-10 required=5 tests=[ALL_TRUSTED=-1]
 autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id PukRqzkYtYw6; Wed,  8 Nov 2023 16:15:10 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
        by mx.kolabnow.com (Postfix) with ESMTPS id A9CD520AB2F6;
        Wed,  8 Nov 2023 16:15:08 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
        by int-mx009.mykolab.com (Postfix) with ESMTPS id 1F95620CCEC7;
        Wed,  8 Nov 2023 16:15:08 +0100 (CET)
Message-ID: <b9069635-1fd5-442a-9b4c-fdb2522fcfee@hansg.org>
Date:   Wed, 8 Nov 2023 16:15:06 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "andreaskleist@gmail.com" <andreaskleist@gmail.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
 <DM8PR11MB56531D32CC21715B696C961199A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Language: en-US, nl
From:   Hans de Goede <hans@hansg.org>
In-Reply-To: <DM8PR11MB56531D32CC21715B696C961199A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,
On 11/8/23 15:31, Cao, Bingbu wrote:
> Hans,
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
>> -----Original Message-----
>> From: Hans de Goede <hans@hansg.org>
>> Sent: Wednesday, November 8, 2023 8:00 PM
>> To: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
>> sakari.ailus@linux.intel.com; laurent.pinchart@ideasonboard.com
>> Cc: andriy.shevchenko@linux.intel.com; hdegoede@redhat.com;
>> ilpo.jarvinen@linux.intel.com; andreaskleist@gmail.com;
>> claus.stovgaard@gmail.com; tfiga@chromium.org; senozhatsky@chromium.org;
>> tomi.valkeinen@ideasonboard.com; bingbu.cao@linux.intel.com; Qiu, Tian Shu
>> <tian.shu.qiu@intel.com>; Wang, Hongju <hongju.wang@intel.com>
>> Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
>>
>> Hi Bingbu,
>>
>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>> IPU6 has its own firmware which exposes ABIs to driver, and
>>> communicates with CSE to do firmware authentication. IPU6 has its MMU
>>> hardware, so the driver sets up a page table to allow IPU6 DMA to
>>> access the system memory.
>>>
>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>
>> I have been testing this on a TigerLake system, a Dell Latitude 9420 with
>> ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P, which
>> libcamera together with (WIP) software debayer support picks by default
>> does not work. There are many many CSI errors in dmesg and only the first
>> 10 or so lines of the image show.
>>
>> Disabling the packed format by removing it from ipu6_isys_pfmts[], making
>> libcamera pick the unpacked (every 10 bits per pixel data stored in a 16
>> bit word in output buffer) fixes this.
>>
>> Are the packed bayer formats supposed to work on Tiger Lake, or is this a
>> known issue which Intel's own userspace stack avoids by always picking the
>> unpacked format ?
> 
> Thanks for the test.
> 
> I remember I verified SGRBG10P format on my ADL device before, but I have
> not tested that for a while, give me some time to test again and come back.

I can confirm that SGRBG10P works on Alderlake it appears to be broken
on Tiger Lake though.

Regards,

Hans

