Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5703D69D280
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 19:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjBTSEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 13:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBTSEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 13:04:00 -0500
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9697F1BDA
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:03:58 -0800 (PST)
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay03.hostedemail.com (Postfix) with ESMTP id 81791A040A;
        Mon, 20 Feb 2023 18:03:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: paulnee@xplornet.com) by omf19.hostedemail.com (Postfix) with ESMTPA id AC31820028;
        Mon, 20 Feb 2023 18:03:54 +0000 (UTC)
Message-ID: <eb478e7a-4e9a-69b4-b99c-b096016b76be@xplornet.com>
Date:   Mon, 20 Feb 2023 13:03:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: uvcvideo
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
 <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com>
 <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
 <Y+l02luLG22ymOXC@pendragon.ideasonboard.com>
 <a8e734f5-4506-50c7-0bde-b57844954222@xplornet.com>
 <Y+orMX89blS1enED@pendragon.ideasonboard.com>
 <29625514-80d8-7b67-79b7-9e8db39b5301@xplornet.com>
 <CANiDSCvjw31+H7eYCzT7t1zs-eQ1kZHR-FQv42e5PYSNOk574w@mail.gmail.com>
Content-Language: en-US
From:   Paul Neelands <paulnee@xplornet.com>
In-Reply-To: <CANiDSCvjw31+H7eYCzT7t1zs-eQ1kZHR-FQv42e5PYSNOk574w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: AC31820028
X-Stat-Signature: cxte9rc9k3ko1u6dcobe5oppyt9j1h8i
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Session-Marker: 7061756C6E65654078706C6F726E65742E636F6D
X-Session-ID: U2FsdGVkX1894xY+6YQ57vNyb7o04zO3/RhYgbe57bA=
X-HE-Tag: 1676916234-49523
X-HE-Meta: U2FsdGVkX19krKnpS0RZV9Sk/rjvb1kV6mOa9YHa14CZNeuOBzYiSrJrTZglq3aLVWVkkAKBGZbXa5vDjRYuKQ==
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Sometimes the simplest things stump me. The privacy switch was it on 
both laptops.

Thanks very much for all the thought and help.

Paul Neelands

-------------------------------------

On 2/20/23 11:36, Ricardo Ribalda wrote:
> Hi Paul
>
> Sorry if you have already checked it, but: are you sure that the
> privacy switch is not toggled on your device?
> https://dl.dell.com/topicspdf/inspiron-16-7610-laptop_users-guide_en-us.pdf
>
> Can you try running yavta with something like:
>
> yavta -l  --capture=3 -F /dev/video0
>
> and then shading the output of yavta, and maybe also the generated
> file frame-000002.bin
>
> Thanks
>
> On Mon, 13 Feb 2023 at 15:04, Paul Neelands <paulnee@xplornet.com> wrote:
>> Attached is kern.log after running and closing 'cheese' and then
>> 'webcamoid'.
>>
>> Thanks for all your input.
>>
>> Paul
>>
>> ---------------------------------------
>>
>> On 2/13/23 07:21, Laurent Pinchart wrote:
>>> Hi Paul,
>>>
>>> On Sun, Feb 12, 2023 at 07:14:46PM -0500, Paul Neelands wrote:
>>>> Cheese gives a black  screen with the light on.
>>>>
>>>> Webcamoid does the same.
>>>>
>>>> Zoom does the same.
>>> Could you send me the kernel log after running one of those applications
>>> ?
>>>
>>>> Attached is the output of v4l-info.
>>>>
>>>> All of these work on the Inspiron 15 3000 but not  on the Inspiron 16.
>>>> They both have the same camera. The only difference is that the Inspiron
>>>> 15 camera is on usb bus 1 while the Inspiron 16 camera is on usb bus 2.
>>>>
>>>> Thanks for the reply.
>>>>
>>>> Paul
>>>>
>>>> -------------------------
>>>>
>>>> On 2/12/23 18:23, Laurent Pinchart wrote:
>>>>> Hi Paul,
>>>>>
>>>>> Please don't drop the mailing list in your replies.
>>>>>
>>>>> On Sun, Feb 12, 2023 at 05:06:37PM -0500, Paul Neelands wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Thanks for the reply.
>>>>>>
>>>>>> There is only one video device so I am confused about video0 & video1.
>>>>>>
>>>>>>
>>>>>> ls -l /dev/video*
>>>>>> crw-rw----+ 1 root video 81, 0 Feb 12 16:23 /dev/video0
>>>>>> crw-rw----+ 1 root video 81, 1 Feb 12 16:23 /dev/video1
>>>>>>
>>>>>> ls -l /sys/class/video4linux/video*
>>>>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video0->
>>>>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video0
>>>>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video1->
>>>>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video1
>>>>>>
>>>>>> lsusb -v -d 0c45:6739 is attached as file lsusb.
>>>>>>
>>>>>> */var/log/kern.**log is attached as file klog*
>>>>> Nothing strikes me as wrong there. You said your webcam doesn't work,
>>>>> could you please elaborate ?
>>>>>
>>>>>> On 2/12/23 16:04, Laurent Pinchart wrote:
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> (CC'ing the linux-media mailing list)
>>>>>>>
>>>>>>> On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
>>>>>>>> Hi.
>>>>>>>>
>>>>>>>> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
>>>>>>>> is the same as a Dell Inspiron 15 3000 that I have where it works. The
>>>>>>>> difference between the two machines is that on the I15 it is on usb bus 1
>>>>>>>> whereas it is on bus 2 on the I16.
>>>>>>>>
>>>>>>>> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
>>>>>>>> driver for the camera uvcvideo but haven't yet figured out where it finds the
>>>>>>>> usb bus. The lsusb of the camera is:
>>>>>>>>
>>>>>>>>      Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
>>>>>>>>
>>>>>>>> The kernel finds it with the demsg:
>>>>>>>>
>>>>>>>>       13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)
>>>>>>>>             14.059462] usbcore: registered new interface driver uvcvideo
>>>>>>>>
>>>>>>>> I would really appreciate some help on where and how the usb bus gets
>>>>>>>> enumerated for the camera.
>>>>>>> What's the output of `ls -l /sys/class/video4linux/video*/` and
>>>>>>> `ls -l /dev/video*` ?
>>>>>>>
>>>>>>> Could you provide your full kernel log, as well as the output of
>>>>>>> `lsusb -v -d 0c45:6739` (if possible running as root, for instance with
>>>>>>> sudo) ?
>
>
