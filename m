Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51752C5F8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 13:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfE1L51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 07:57:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41971 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbfE1L51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 07:57:27 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VajHhpTIs3qlsVajIhlBWr; Tue, 28 May 2019 13:57:25 +0200
Subject: Re: test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
References: <CA+G9fYuC8dgKs04HmyCaKeQ_xwqKBxnh=zsOFjQK+3Fq7AZRyw@mail.gmail.com>
 <5de0df37-f0d0-f54c-2eef-a7533cbe7a25@xs4all.nl>
 <CA+G9fYtbb82EPY9gG63+U2FTVswt7f3FjHdaHMA2kibxgVvZcw@mail.gmail.com>
 <CA+G9fYu-guJaWDrEp5=KeJsje6Teo-V=_AhFStf0gnLk-QNfzA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <29b08b95-ae5b-2989-8f09-93fe702aef29@xs4all.nl>
Date:   Tue, 28 May 2019 13:57:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu-guJaWDrEp5=KeJsje6Teo-V=_AhFStf0gnLk-QNfzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAf1fQ/u7BjVvRc+OXOLqg/gWVFvX8Bg76u1gFLh+Kd3bxp1C3HBEjOsgAw4E4bYOSJcycXRQCoIHuoqnsoLgat3p0ZoDyUZSSDg7jvpTpkA1zw3nALP
 wtCkHAw2elzp683xExxFv77bw9lzvHfGTxVyHN1kfndBp4QoK8w43Tnaw55YeAqRrUgcykJEq84WrODLmwMQ9LocMMEhK5vdH11C7PnEXI8k1UyguZQkzfi/
 h0LJWioquEDdkmBJLF9zGWpY7oIheZSQ3E9IWYFbqt/E99WBS8j9BUCfiOplsWAmr8sjcS47fzxKc51i5p5qFmaSJtDidkmQHVfdcj8m6wkw4QU5BOiSimMC
 PMfTwj+Sxoq7fXUWgvOm4vzH9KWIe6KKtQ7AP7CqslZ1Q6YvgSrLAKuJ2KDCp1iXlCXLfZ1c/zjcgMz3H9CIrxOsKNpDRnxNMtUOm2cMAgti7iAfVjbP829N
 N1+wJYq5irn2oVwsfwsRQs+JabCNPj2eF7eC9vVOImeRFfBY6Rc/cYmp4BOjSM1V33fx5n2n/8lUGgQCA+8sht/Gf06nptGYsjMdZHuEU1e0oGnpMv6pXA2N
 mrVvOHJ2oAX4/Wb/Dr7dRf44X56MfWqB4RBeFAbdQqHcTOGyKjIGHaRHiASXl00kFqsZdS+eta0QdBwEJg0rBURlAd+djkzZJNB253obSEqtArSqtPuvH92T
 C6nDVb8/qpU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/28/19 12:16 PM, Naresh Kamboju wrote:
> Hi Hans,
> 
> On Mon, 20 May 2019 at 19:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> Hi Hans,
>>
>> On Mon, 13 May 2019 at 19:08, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> On 5/13/19 3:32 PM, Naresh Kamboju wrote:
>>>> Do you see test VIDIOC_G/S_PARM: FAIL on stable 4.14, 4.9 and 4.4
>>>> kernel branches ?
>>>
>>> Probably related to commit 8a7c5594c0202 (media: v4l2-ioctl: clear fields in s_parm).
>>
>> I have cherry-picked on stable rc 4.9 branch and tested and test got
>> PASS on x86_64.
> 
> I have cherry-picked for stable -rc 4.14 and 4.9 and test got PASS.

Just to be clear: you cherry-picked commit 8a7c5594c0202 (media: v4l2-ioctl: clear
fields in s_parm) for both 4.9 and 4.14, right?

If so, feel free to post that patch to the stable mailinglist for those kernels.
Make sure you CC me when you do that.

> 
> do you want to queue this for stable rc 4.14 and 4.9 ?
> 
> I have tested for 4.4 with patch applied but failed with below error.
> 
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>  warn: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1237):
> S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
>  fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1139):
> node->has_frmintervals && !cap->capability
> test VIDIOC_G/S_PARM: FAIL

You probably need commit f63998331935 ([media] vivid: set V4L2_CAP_TIMEPERFRAME)
and possibly commit 3f122df4a2ba (media: vivid: do not implement VIDIOC_S_PARM for output streams).

Regards,

	Hans

> 
> 4.4 - failed log
> https://lkft.validation.linaro.org/scheduler/job/746548#L1678
> 
> ref:
> 4.14 pass log,
> https://lkft.validation.linaro.org/scheduler/job/739126#L1843
> 
> 4.9 pass log,
> https://lkft.validation.linaro.org/scheduler/job/736243#L1744
> 
> - Naresh
> 

