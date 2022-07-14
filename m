Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C265747DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 11:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiGNJKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 05:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiGNJKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 05:10:24 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1745A1EEC4
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657789823; x=1689325823;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4V3DPEFZ0+N/JMvFKqEVFiVSDiAYe8ds+Q5qfhSx0hk=;
  b=XTb8z45+8J/axHq9goWTWoalmry/7cuCxgjwNHwaTCG2ewFb7/lduE1j
   pC4nBE/3+YuSXDfOMQ/RaW20V6kk/CNtioW4/tvCq5W4ldWQXBk8tJJwj
   gmvuasGaPdQrbVi3UAFUhckiAASEU0W3zUrjfotvNJA4a3wpf7iDcxp0l
   eFAmNkDxgBdpof/ssg7NDGnBGE+GXeRfSRpAV1OjU4gw0DHZYwZS6uvGM
   I55LKj0wNfOODpmpKqfl8HKXLJicMS+dXYfa1AWIPTxExmb55XAQ6/Tjy
   nf7YdFX+Nuju3jhqsUnsjxlEIIIbxj0zGB1nJShfUziZBWjuMf7BrlPhp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347141444"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="347141444"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 02:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="922998879"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 02:10:16 -0700
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Tomasz Figa <tfiga@chromium.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
 <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com>
 <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
 <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com>
 <CAAFQd5DZGPWmZgRYjdwzk7Mm3OAviDrH24NyWxEredcgA2TMTQ@mail.gmail.com>
 <YlbR3uQLiXoJcrhQ@paasikivi.fi.intel.com>
 <CAAFQd5CTnHi60OYbSq-UiSozAww7SZZtTA9OBm83AeVzkettiw@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e3d1fcab-75a8-1617-c93b-111dd8df66b9@linux.intel.com>
Date:   Thu, 14 Jul 2022 17:08:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CTnHi60OYbSq-UiSozAww7SZZtTA9OBm83AeVzkettiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomasz and Sakari,

Is there any conclusion of this support for both OF and
ACPI platform? 


On 4/13/22 9:44 PM, Tomasz Figa wrote:
> On Wed, Apr 13, 2022 at 10:36 PM sakari.ailus@linux.intel.com
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Hi Tomasz,
>>
>> On Wed, Apr 13, 2022 at 09:17:47PM +0900, Tomasz Figa wrote:
>>> On Wed, Apr 13, 2022 at 8:40 PM sakari.ailus@linux.intel.com
>>> <sakari.ailus@linux.intel.com> wrote:
>>>>
>>>> Hi Tomasz, Bingbu,
>>>>
>>>> On Tue, Apr 12, 2022 at 08:15:08PM +0900, Tomasz Figa wrote:
>>>>> On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 4/12/22 5:39 PM, Tomasz Figa wrote:
>>>>>>> On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>>>>>>>
>>>>>>>> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Tomasz Figa <tfiga@chromium.org>
>>>>>>>>>> Sent: Friday, November 5, 2021 2:55 PM
>>>>>>>>>> To: Cao, Bingbu <bingbu.cao@intel.com>
>>>>>>>>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
>>>>>>>>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
>>>>>>>>>> bingbu.cao@linux.intel.com
>>>>>>>>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
>>>>>>>>>> device
>>>>>>>>>>
>>>>>>>>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> When dw9768 working with ACPI systems, the dw9768 was turned by
>>>>>>>>>>> i2c-core during probe, driver need activate the PM runtime and ask
>>>>>>>>>>> runtime PM to turn off the device.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
>>>>>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
>>>>>>>>>>> index c086580efac7..65c6acf3ced9 100644
>>>>>>>>>>> --- a/drivers/media/i2c/dw9768.c
>>>>>>>>>>> +++ b/drivers/media/i2c/dw9768.c
>>>>>>>>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
>>>>>>>>>>> *client)
>>>>>>>>>>>
>>>>>>>>>>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>>>>>>>>>>>
>>>>>>>>>>> +       /*
>>>>>>>>>>> +        * Device is already turned on by i2c-core with ACPI domain PM.
>>>>>>>>>>> +        * Attempt to turn off the device to satisfy the privacy LED
>>>>>>>>>> concerns.
>>>>>>>>>>> +        */
>>>>>>>>>>> +       pm_runtime_set_active(dev);
>>>>>>>>>>
>>>>>>>>>> This driver is used by non-ACPI systems as well. This change will make
>>>>>>>>>> the PM core not call the runtime_resume() callback provided by the
>>>>>>>>>> driver and the power would never be turned on on such systems.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
>>>>>>>>>> ACPI domain power on at boot up and eliminate the need for this change?
>>>>>>>>>
>>>>>>>>> Tomasz, thanks for your review.
>>>>>>>>>
>>>>>>>>> The comment here is invalid, it should not be strongly related to the privacy
>>>>>>>>> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
>>>>>>>>> systems even without Sakari's changes.
>>>>>>>>>
>>>>>>>>> I am wondering how the driver work with PM core on non-ACPI system.
>>>>>>>>>
>>>>>>>>
>>>>>>>> On non-ACPI systems it's the driver which handles the power sequencing
>>>>>>>> of the chip so the regulators wouldn't be implicitly enabled by the
>>>>>>>> subsystem before (unless they're shared with some other device and the
>>>>>>>> corresponding driver enabled them).
>>>>>>>
>>>>>>> It looks like this patch made into Linus' tree and broke the driver on
>>>>>>> ARM devices. Could we please revert it?
>>>>>>
>>>>>> If revert the patch, the device will not work on ACPI system, is there some
>>>>>> other solution? Have no details about the failure on ARM device.
>>>>>>
>>>>>
>>>>> I believe it worked on ACPI systems, just runtime PM wasn't suspending
>>>>> the device.
>>>>>
>>>>> That said, if my comment above was addressed instead of being ignored,
>>>>> this regression wouldn't have happened. The problem is described in my
>>>>> previous messages, please get back to them and address the issue I
>>>>> pointed out.
>>>>
>>>> First of all, thanks for catching this.
>>>>
>>>> What I believe happened was that the patch was merged to my tree before you
>>>> commented on it and then I missed the related follow-up discussion.
>>>>
>>>> Looking at the patch itself, it seems fine as such but there's a problem
>>>> with the driver to begin with: the device isn't powered on in probe on DT
>>>> systems but still its runtime suspend callback is called through
>>>> pm_runtime_idle().
>>>>
>>>> Normally calling the RT suspend callback is what we want, but in this case
>>>> disabling a regulator that wasn't enabled is a problem.
>>>>
>>>> There also seems to be a problem in error handling... and the driver does
>>>> not support probing while powered off on ACPI. Oh well.
>>>>
>>>> Let's revert the patch now but it seems there's something to fix
>>>> afterwards.
>>>
>>> Thanks Sakari.
>>>
>>> One of possible ways to fix this would be to always turn on the
>>> regulators in the probe, although it would result in the privacy LED
>>> blinking issue on our ARM systems.
>>>
>>> I wonder if we're missing something in how the ACPI runtime PM works
>>> on Linux. It sounds strange to me that the driver needs to be aware of
>>> the ACPI internals and know that the default boot-up state is powered
>>
>> Not really ACPI internals, just that the I涎 devices are powered on for
>> probe.
> 
> Do you mean the dev_pm_domain_attach() call at [1]?
> I suspect that it wouldn't have any effect on anything other than ACPI.
> That said, I guess it's indeed a design decision in the I2C subsystem...
> 
> One thing that could help here would be adding a .sync callback to
> acpi_general_pm_domain, which would turn off the ACPI companion device
> if dev is suspended.
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-base.c#L544
> 
>>
>>> on. Maybe there is another function that we could call instead of
>>> pm_runtime_set_active()+pm_runtime_idle() that would only shut down
>>> the PM domain, while leaving the device itself alone?
>>
>> Laurent recently complained about the complexities of supporting runtime PM
>> on drivers with both OF and ACPI support. I was planning to reply, will
>> include you.
> 
> That would be great, thanks!
> 
> Best regards,
> Tomasz
> 

-- 
Best regards,
Bingbu Cao
