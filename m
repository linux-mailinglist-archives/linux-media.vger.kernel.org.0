Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15062693B4F
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 01:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjBMAW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 19:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBMAWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 19:22:55 -0500
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Feb 2023 16:22:53 PST
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B2F61AC
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 16:22:53 -0800 (PST)
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay06.hostedemail.com (Postfix) with ESMTP id 6D734AAFE5;
        Mon, 13 Feb 2023 00:14:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: paulnee@xplornet.com) by omf07.hostedemail.com (Postfix) with ESMTPA id C3B5D20024;
        Mon, 13 Feb 2023 00:14:47 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------Be5pjZ8Cgb08AIs0zRtIJu0G"
Message-ID: <a8e734f5-4506-50c7-0bde-b57844954222@xplornet.com>
Date:   Sun, 12 Feb 2023 19:14:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: uvcvideo
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
 <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com>
 <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
 <Y+l02luLG22ymOXC@pendragon.ideasonboard.com>
From:   Paul Neelands <paulnee@xplornet.com>
In-Reply-To: <Y+l02luLG22ymOXC@pendragon.ideasonboard.com>
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: C3B5D20024
X-Stat-Signature: tqfuew4tx48n1318mg8ujmiokxrm3hrw
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        RDNS_NUM_TLD_ATCHNX,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Session-Marker: 7061756C6E65654078706C6F726E65742E636F6D
X-Session-ID: U2FsdGVkX18BWsVGvnwQC/TF/zGqhHHx1QLDQCAf7oY=
X-HE-Tag: 1676247287-561401
X-HE-Meta: U2FsdGVkX1+YL4k2QSY7zf47cOJZs5bYrjXj3zR4ofcVVWTVJoesp6mFkve1D1P5x2UW0PVl4OUBjRj/7TtbKg==
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------Be5pjZ8Cgb08AIs0zRtIJu0G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Cheese gives a black  screen with the light on.

Webcamoid does the same.

Zoom does the same.

Attached is the output of v4l-info.

All of these work on the Inspiron 15 3000 but not  on the Inspiron 16. 
They both have the same camera. The only difference is that the Inspiron 
15 camera is on usb bus 1 while the Inspiron 16 camera is on usb bus 2.

Thanks for the reply.

Paul

-------------------------

On 2/12/23 18:23, Laurent Pinchart wrote:
> Hi Paul,
>
> Please don't drop the mailing list in your replies.
>
> On Sun, Feb 12, 2023 at 05:06:37PM -0500, Paul Neelands wrote:
>> Hi,
>>
>> Thanks for the reply.
>>
>> There is only one video device so I am confused about video0 & video1.
>>
>>
>> ls -l /dev/video*
>> crw-rw----+ 1 root video 81, 0 Feb 12 16:23 /dev/video0
>> crw-rw----+ 1 root video 81, 1 Feb 12 16:23 /dev/video1
>>
>> ls -l /sys/class/video4linux/video*
>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video0->
>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video0
>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video1->
>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video1
>>
>> lsusb -v -d 0c45:6739 is attached as file lsusb.
>>
>> */var/log/kern.**log is attached as file klog*
> Nothing strikes me as wrong there. You said your webcam doesn't work,
> could you please elaborate ?
>
>> On 2/12/23 16:04, Laurent Pinchart wrote:
>>> Hi Paul,
>>>
>>> (CC'ing the linux-media mailing list)
>>>
>>> On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
>>>> Hi.
>>>>
>>>> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
>>>> is the same as a Dell Inspiron 15 3000 that I have where it works. The
>>>> difference between the two machines is that on the I15 it is on usb bus 1
>>>> whereas it is on bus 2 on the I16.
>>>>
>>>> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
>>>> driver for the camera uvcvideo but haven't yet figured out where it finds the
>>>> usb bus. The lsusb of the camera is:
>>>>
>>>>    Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
>>>>
>>>> The kernel finds it with the demsg:
>>>>
>>>>     13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)
>>>>           14.059462] usbcore: registered new interface driver uvcvideo
>>>>
>>>> I would really appreciate some help on where and how the usb bus gets
>>>> enumerated for the camera.
>>> What's the output of `ls -l /sys/class/video4linux/video*/` and
>>> `ls -l /dev/video*` ?
>>>
>>> Could you provide your full kernel log, as well as the output of
>>> `lsusb -v -d 0c45:6739` (if possible running as root, for instance with
>>> sudo) ?
>
--------------Be5pjZ8Cgb08AIs0zRtIJu0G
Content-Type: text/plain; charset=UTF-8; name="v4linfo"
Content-Disposition: attachment; filename="v4linfo"
Content-Transfer-Encoding: base64

djRsLWluZm8KCiMjIyB2NGwyIGRldmljZSBpbmZvIFsvZGV2L3ZpZGVvMF0gIyMjCmdlbmVy
YWwgaW5mbwogICAgVklESU9DX1FVRVJZQ0FQCiAgICAgICAgZHJpdmVyICAgICAgICAgICAg
ICAgICAgOiAidXZjdmlkZW8iCiAgICAgICAgY2FyZCAgICAgICAgICAgICAgICAgICAgOiAi
SW50ZWdyYXRlZF9XZWJjYW1fRkhEOiBJbnRlZ3JhdCIKICAgICAgICBidXNfaW5mbyAgICAg
ICAgICAgICAgICA6ICJ1c2ItMDAwMDowMDoxNC4wLTYiCiAgICAgICAgdmVyc2lvbiAgICAg
ICAgICAgICAgICAgOiA2LjIuMAogICAgICAgIGNhcGFiaWxpdGllcyAgICAgICAgICAgIDog
MHg4NGEwMDAwMSBbVklERU9fQ0FQVFVSRSw/LD8sU1RSRUFNSU5HLChudWxsKV0KCnN0YW5k
YXJkcwoKaW5wdXRzCiAgICBWSURJT0NfRU5VTUlOUFVUKDApCiAgICAgICAgaW5kZXggICAg
ICAgICAgICAgICAgICAgOiAwCiAgICAgICAgbmFtZSAgICAgICAgICAgICAgICAgICAgOiAi
Q2FtZXJhIDEiCiAgICAgICAgdHlwZSAgICAgICAgICAgICAgICAgICAgOiBDQU1FUkEKICAg
ICAgICBhdWRpb3NldCAgICAgICAgICAgICAgICA6IDAKICAgICAgICB0dW5lciAgICAgICAg
ICAgICAgICAgICA6IDAKICAgICAgICBzdGQgICAgICAgICAgICAgICAgICAgICA6IDB4MCBb
XQogICAgICAgIHN0YXR1cyAgICAgICAgICAgICAgICAgIDogMHgwIFtdCgp2aWRlbyBjYXB0
dXJlCiAgICBWSURJT0NfRU5VTV9GTVQoMCxWSURFT19DQVBUVVJFKQogICAgICAgIGluZGV4
ICAgICAgICAgICAgICAgICAgIDogMAogICAgICAgIHR5cGUgICAgICAgICAgICAgICAgICAg
IDogVklERU9fQ0FQVFVSRQogICAgICAgIGZsYWdzICAgICAgICAgICAgICAgICAgIDogMQog
ICAgICAgIGRlc2NyaXB0aW9uICAgICAgICAgICAgIDogIk1vdGlvbi1KUEVHIgogICAgICAg
IHBpeGVsZm9ybWF0ICAgICAgICAgICAgIDogMHg0NzUwNGE0ZCBbTUpQR10KICAgIFZJRElP
Q19FTlVNX0ZNVCgxLFZJREVPX0NBUFRVUkUpCiAgICAgICAgaW5kZXggICAgICAgICAgICAg
ICAgICAgOiAxCiAgICAgICAgdHlwZSAgICAgICAgICAgICAgICAgICAgOiBWSURFT19DQVBU
VVJFCiAgICAgICAgZmxhZ3MgICAgICAgICAgICAgICAgICAgOiAwCiAgICAgICAgZGVzY3Jp
cHRpb24gICAgICAgICAgICAgOiAiWVVZViA0OjI6MiIKICAgICAgICBwaXhlbGZvcm1hdCAg
ICAgICAgICAgICA6IDB4NTY1OTU1NTkgW1lVWVZdCiAgICBWSURJT0NfR19GTVQoVklERU9f
Q0FQVFVSRSkKICAgICAgICB0eXBlICAgICAgICAgICAgICAgICAgICA6IFZJREVPX0NBUFRV
UkUKICAgICAgICBmbXQucGl4LndpZHRoICAgICAgICAgICA6IDE5MjAKICAgICAgICBmbXQu
cGl4LmhlaWdodCAgICAgICAgICA6IDEwODAKICAgICAgICBmbXQucGl4LnBpeGVsZm9ybWF0
ICAgICA6IDB4NDc1MDRhNGQgW01KUEddCiAgICAgICAgZm10LnBpeC5maWVsZCAgICAgICAg
ICAgOiBOT05FCiAgICAgICAgZm10LnBpeC5ieXRlc3BlcmxpbmUgICAgOiAwCiAgICAgICAg
Zm10LnBpeC5zaXplaW1hZ2UgICAgICAgOiA0MTQ3Nzg5CiAgICAgICAgZm10LnBpeC5jb2xv
cnNwYWNlICAgICAgOiBTUkdCCiAgICAgICAgZm10LnBpeC5wcml2ICAgICAgICAgICAgOiA0
Mjc2OTk2ODYyCgpjb250cm9scwogICAgVklESU9DX1FVRVJZQ1RSTChCQVNFKzApCiAgICAg
ICAgaWQgICAgICAgICAgICAgICAgICAgICAgOiA5OTYzNzc2CiAgICAgICAgdHlwZSAgICAg
ICAgICAgICAgICAgICAgOiBJTlRFR0VSCiAgICAgICAgbmFtZSAgICAgICAgICAgICAgICAg
ICAgOiAiQnJpZ2h0bmVzcyIKICAgICAgICBtaW5pbXVtICAgICAgICAgICAgICAgICA6IC02
NAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAgIDogNjQKICAgICAgICBzdGVwICAg
ICAgICAgICAgICAgICAgICA6IDEKICAgICAgICBkZWZhdWx0X3ZhbHVlICAgICAgICAgICA6
IDAKICAgICAgICBmbGFncyAgICAgICAgICAgICAgICAgICA6IHVua25vd24KICAgIFZJRElP
Q19RVUVSWUNUUkwoQkFTRSsxKQogICAgICAgIGlkICAgICAgICAgICAgICAgICAgICAgIDog
OTk2Mzc3NwogICAgICAgIHR5cGUgICAgICAgICAgICAgICAgICAgIDogSU5URUdFUgogICAg
ICAgIG5hbWUgICAgICAgICAgICAgICAgICAgIDogIkNvbnRyYXN0IgogICAgICAgIG1pbmlt
dW0gICAgICAgICAgICAgICAgIDogMAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAg
IDogOTUKICAgICAgICBzdGVwICAgICAgICAgICAgICAgICAgICA6IDEKICAgICAgICBkZWZh
dWx0X3ZhbHVlICAgICAgICAgICA6IDAKICAgICAgICBmbGFncyAgICAgICAgICAgICAgICAg
ICA6IHVua25vd24KICAgIFZJRElPQ19RVUVSWUNUUkwoQkFTRSsyKQogICAgICAgIGlkICAg
ICAgICAgICAgICAgICAgICAgIDogOTk2Mzc3OAogICAgICAgIHR5cGUgICAgICAgICAgICAg
ICAgICAgIDogSU5URUdFUgogICAgICAgIG5hbWUgICAgICAgICAgICAgICAgICAgIDogIlNh
dHVyYXRpb24iCiAgICAgICAgbWluaW11bSAgICAgICAgICAgICAgICAgOiAwCiAgICAgICAg
bWF4aW11bSAgICAgICAgICAgICAgICAgOiAxMDAKICAgICAgICBzdGVwICAgICAgICAgICAg
ICAgICAgICA6IDEKICAgICAgICBkZWZhdWx0X3ZhbHVlICAgICAgICAgICA6IDY0CiAgICAg
ICAgZmxhZ3MgICAgICAgICAgICAgICAgICAgOiB1bmtub3duCiAgICBWSURJT0NfUVVFUllD
VFJMKEJBU0UrMykKICAgICAgICBpZCAgICAgICAgICAgICAgICAgICAgICA6IDk5NjM3NzkK
ICAgICAgICB0eXBlICAgICAgICAgICAgICAgICAgICA6IElOVEVHRVIKICAgICAgICBuYW1l
ICAgICAgICAgICAgICAgICAgICA6ICJIdWUiCiAgICAgICAgbWluaW11bSAgICAgICAgICAg
ICAgICAgOiAtMjAwMAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAgIDogMjAwMAog
ICAgICAgIHN0ZXAgICAgICAgICAgICAgICAgICAgIDogMQogICAgICAgIGRlZmF1bHRfdmFs
dWUgICAgICAgICAgIDogMAogICAgICAgIGZsYWdzICAgICAgICAgICAgICAgICAgIDogdW5r
bm93bgogICAgVklESU9DX1FVRVJZQ1RSTChCQVNFKzEyKQogICAgICAgIGlkICAgICAgICAg
ICAgICAgICAgICAgIDogOTk2Mzc4OAogICAgICAgIHR5cGUgICAgICAgICAgICAgICAgICAg
IDogQk9PTEVBTgogICAgICAgIG5hbWUgICAgICAgICAgICAgICAgICAgIDogIldoaXRlIEJh
bGFuY2UsIEF1dG9tYXRpYyIKICAgICAgICBtaW5pbXVtICAgICAgICAgICAgICAgICA6IDAK
ICAgICAgICBtYXhpbXVtICAgICAgICAgICAgICAgICA6IDEKICAgICAgICBzdGVwICAgICAg
ICAgICAgICAgICAgICA6IDEKICAgICAgICBkZWZhdWx0X3ZhbHVlICAgICAgICAgICA6IDEK
ICAgICAgICBmbGFncyAgICAgICAgICAgICAgICAgICA6IHVua25vd24KICAgIFZJRElPQ19R
VUVSWUNUUkwoQkFTRSsxNikKICAgICAgICBpZCAgICAgICAgICAgICAgICAgICAgICA6IDk5
NjM3OTIKICAgICAgICB0eXBlICAgICAgICAgICAgICAgICAgICA6IElOVEVHRVIKICAgICAg
ICBuYW1lICAgICAgICAgICAgICAgICAgICA6ICJHYW1tYSIKICAgICAgICBtaW5pbXVtICAg
ICAgICAgICAgICAgICA6IDEwMAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAgIDog
MzAwCiAgICAgICAgc3RlcCAgICAgICAgICAgICAgICAgICAgOiAxCiAgICAgICAgZGVmYXVs
dF92YWx1ZSAgICAgICAgICAgOiAxMDAKICAgICAgICBmbGFncyAgICAgICAgICAgICAgICAg
ICA6IHVua25vd24KICAgIFZJRElPQ19RVUVSWUNUUkwoQkFTRSsxOSkKICAgICAgICBpZCAg
ICAgICAgICAgICAgICAgICAgICA6IDk5NjM3OTUKICAgICAgICB0eXBlICAgICAgICAgICAg
ICAgICAgICA6IElOVEVHRVIKICAgICAgICBuYW1lICAgICAgICAgICAgICAgICAgICA6ICJH
YWluIgogICAgICAgIG1pbmltdW0gICAgICAgICAgICAgICAgIDogMQogICAgICAgIG1heGlt
dW0gICAgICAgICAgICAgICAgIDogOAogICAgICAgIHN0ZXAgICAgICAgICAgICAgICAgICAg
IDogMQogICAgICAgIGRlZmF1bHRfdmFsdWUgICAgICAgICAgIDogMQogICAgICAgIGZsYWdz
ICAgICAgICAgICAgICAgICAgIDogdW5rbm93bgogICAgVklESU9DX1FVRVJZQ1RSTChCQVNF
KzI0KQogICAgICAgIGlkICAgICAgICAgICAgICAgICAgICAgIDogOTk2MzgwMAogICAgICAg
IHR5cGUgICAgICAgICAgICAgICAgICAgIDogTUVOVQogICAgICAgIG5hbWUgICAgICAgICAg
ICAgICAgICAgIDogIlBvd2VyIExpbmUgRnJlcXVlbmN5IgogICAgICAgIG1pbmltdW0gICAg
ICAgICAgICAgICAgIDogMAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAgIDogMgog
ICAgICAgIHN0ZXAgICAgICAgICAgICAgICAgICAgIDogMQogICAgICAgIGRlZmF1bHRfdmFs
dWUgICAgICAgICAgIDogMgogICAgICAgIGZsYWdzICAgICAgICAgICAgICAgICAgIDogdW5r
bm93bgogICAgVklESU9DX1FVRVJZQ1RSTChCQVNFKzI2KQogICAgICAgIGlkICAgICAgICAg
ICAgICAgICAgICAgIDogOTk2MzgwMgogICAgICAgIHR5cGUgICAgICAgICAgICAgICAgICAg
IDogSU5URUdFUgogICAgICAgIG5hbWUgICAgICAgICAgICAgICAgICAgIDogIldoaXRlIEJh
bGFuY2UgVGVtcGVyYXR1cmUiCiAgICAgICAgbWluaW11bSAgICAgICAgICAgICAgICAgOiAy
ODAwCiAgICAgICAgbWF4aW11bSAgICAgICAgICAgICAgICAgOiA2NTAwCiAgICAgICAgc3Rl
cCAgICAgICAgICAgICAgICAgICAgOiAxCiAgICAgICAgZGVmYXVsdF92YWx1ZSAgICAgICAg
ICAgOiA0NjAwCiAgICAgICAgZmxhZ3MgICAgICAgICAgICAgICAgICAgOiBJTkFDVElWRQog
ICAgVklESU9DX1FVRVJZQ1RSTChCQVNFKzI3KQogICAgICAgIGlkICAgICAgICAgICAgICAg
ICAgICAgIDogOTk2MzgwMwogICAgICAgIHR5cGUgICAgICAgICAgICAgICAgICAgIDogSU5U
RUdFUgogICAgICAgIG5hbWUgICAgICAgICAgICAgICAgICAgIDogIlNoYXJwbmVzcyIKICAg
ICAgICBtaW5pbXVtICAgICAgICAgICAgICAgICA6IDEKICAgICAgICBtYXhpbXVtICAgICAg
ICAgICAgICAgICA6IDcKICAgICAgICBzdGVwICAgICAgICAgICAgICAgICAgICA6IDEKICAg
ICAgICBkZWZhdWx0X3ZhbHVlICAgICAgICAgICA6IDIKICAgICAgICBmbGFncyAgICAgICAg
ICAgICAgICAgICA6IHVua25vd24KICAgIFZJRElPQ19RVUVSWUNUUkwoQkFTRSsyOCkKICAg
ICAgICBpZCAgICAgICAgICAgICAgICAgICAgICA6IDk5NjM4MDQKICAgICAgICB0eXBlICAg
ICAgICAgICAgICAgICAgICA6IElOVEVHRVIKICAgICAgICBuYW1lICAgICAgICAgICAgICAg
ICAgICA6ICJCYWNrbGlnaHQgQ29tcGVuc2F0aW9uIgogICAgICAgIG1pbmltdW0gICAgICAg
ICAgICAgICAgIDogMAogICAgICAgIG1heGltdW0gICAgICAgICAgICAgICAgIDogMwogICAg
ICAgIHN0ZXAgICAgICAgICAgICAgICAgICAgIDogMQogICAgICAgIGRlZmF1bHRfdmFsdWUg
ICAgICAgICAgIDogMwogICAgICAgIGZsYWdzICAgICAgICAgICAgICAgICAgIDogdW5rbm93
bgo=

--------------Be5pjZ8Cgb08AIs0zRtIJu0G--
