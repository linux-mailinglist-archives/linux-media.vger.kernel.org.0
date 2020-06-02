Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1201EB9C7
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 12:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgFBKog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 06:44:36 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59537 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726267AbgFBKoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 06:44:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g4P6jXBaDCKzeg4PAjJ3Qt; Tue, 02 Jun 2020 12:44:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591094672; bh=1WzPUPBIE0Uaz6t74C5WQPm2crJOnZO/Fn4WuxbrM0s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Z4VUDVFHsqJqWJs8+DlWcTaWPdwdnw8gko60VMLYOilDzsUb3W8+durQUBUvL5+oP
         Sthoq+4c1YJQUssMAIP8WtDOkOEttFDeVrrD6AZGYw8oYA+2yI2TQnBF2X6kmgWGV4
         Zk0/NJHVeACTXGcWwimmntqZ3nYTeN+VDhP8Oa1q4nKJBQxh02kYO2Xza7ByPTIxqK
         rLUZh0fwu14Db/HnVXJhj/fnwO+XXzH/c0reY9pENHv9o0NymHsHrKZSeL5ijvifZS
         eqGQmISUDPh3UywOeyL0vtdLYH+uo/HdMuJoKr4p6EfTB7byOgX4OUYfl4MiXNISuo
         6mq+X5GqEFaGg==
Subject: Re: [PATCH v2 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
To:     Vishal Sagar <vsagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Joe Perches <joe@perches.com>
References: <20200429141705.18755-1-vishal.sagar@xilinx.com>
 <20200429141705.18755-3-vishal.sagar@xilinx.com>
 <368b7efb-3faf-bb71-2bd0-826f2ab031e6@xs4all.nl>
 <DM6PR02MB6876F989682935D38AA9BF19A78A0@DM6PR02MB6876.namprd02.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d696e0ed-3e59-f6a6-1f8d-b1725083de84@xs4all.nl>
Date:   Tue, 2 Jun 2020 12:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM6PR02MB6876F989682935D38AA9BF19A78A0@DM6PR02MB6876.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJcogKHJH5sedMLRm7iDVY5GJFXG6YtbvUoqEh55LOJH4zg6u1HF2mt9uivno374New6GAHucz89E7ee6JkqmobSD9+UdFIcUjJTBhrXxr5AdnMfRE74
 IMdRhfoZKwXJPM8ECuNkEsezBa6X1mvtV4C6MBu0ZomrW+4QlMaMTpqpLWO/6EYrP/2ckZFtKcBLQW5Ddzy88Wa35QCRf/48b9AMvCXQr8TW5ZgAEEJRKM3h
 bwY7Daae8yl4w/g8npNRVCkNpqSPm01e0HLBVkYDFnCWHqaD7LFxubGvdWsFmTpE/72ELPTClNJNNBt6Q5kBdPfNbiivna8seASaVVRG8sfFICbSJU3wqKrq
 pDYUz/72ubcrJrgkEB9hsNIN8Li4IpUqOhIZU44mmxGeX+GKtOz+SkXsD65pKw25YJXttlyij3MnBQoeDn1BNNeZrvieDrRfAlHbxAjyxro5a2xiEuMiQC7Y
 gart/4mzMjX0unDnfGYGtXhZIcbp3CWs+spCpm8pWVMkeTqok8tXkkWltkChM5/1Z3ocRSInar4we11HmjVoZi4S4+puW3Y74ROVUyvtZYeJM7rxIquIDwoK
 4OBxnALO+J5qqW91BP7C5Bqz3Z13dtgsPoZLco6VYfTcWRIRuxe706YwxEytmsV1lK8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/06/2020 16:59, Vishal Sagar wrote:
> Hi Hans,
> 
> Thanks for reviewing!
> 
>>> +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
>>> +		if (!xsdirxss->vidlocked) {
>>> +			dev_err(dev, "Can't get values when video not
>> locked!\n");
>>> +			return -EINVAL;
>>> +		}
>>> +		ctrl->val = xsdirxss->ts_is_interlaced;
>>
>> This control makes no sense: the v4l2_dv_timings struct will already tell you
>> if it is an interlaced format or not. Same for v4l2_mbus_framefmt.
>>
> 
> The SDI has a concept of supporting progressive, interlaced (both as we know normally) and a progressive segmented frames(psf).
> The progressive segmented frames have their video content in progressive format but the transport stream is interlaced.
> This is distinguished using the bit 6 and 7 of Byte 2 in the 4 byte ST352 payload.
> Refer to sec 5.3 in SMPTE ST 352:2010.
> 
> This control can be used by the application to distinguish normal interlaced and progressive segmented frames.

Ah, interesting. So this relies on the receiver to reconstruct the progressive
frame by combining the top and bottom field, right?

I think this deserves a new v4l2_field value:

V4L2_FIELD_ALTERNATE_PROG

Basically this is identical to V4L2_FIELD_ALTERNATE, except that the two fields
combine to a single progressive frame.

Regards,

	Hans

PS: I'll look at your other comments separately
