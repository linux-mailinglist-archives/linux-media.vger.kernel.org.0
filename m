Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE3D551AC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbfFYO2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:28:31 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58489 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729336AbfFYO2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:28:31 -0400
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b] ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmQshQq3NSfvXfmQvhHlIE; Tue, 25 Jun 2019 16:28:29 +0200
Subject: Re: [PATCHv8 04/13] cec: expose the new connector info API
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
 <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7b0d4161-8721-5e97-13a6-86274a479314@xs4all.nl>
Date:   Tue, 25 Jun 2019 16:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDn6A1IzA5i/k49nc6h+5f1MJI4kdKyWS0J+bkmSvG+TsMkTkMEq9i33LPv4RAfEuvtVARZLNHpqqouUC/6nI6GXBQ07PA4z4j97LsMTPhyUJQUH+Aq4
 36YiUe0HL8i31HE6z9Wtb3eMotM1lJIQ4iun5I1iYnkL/rO/fgtNG8uyI6EPsjV8IKcKmrCCvHE2dLciRjCCu0RwkwcrUNZ3LNx3pMKbq/B96JRR6BbB/Fes
 nvRA29Uj/Y5K8W6YfxCOd/rD2LQwkvYv5G3ydRZCn51oO8gAIXcPSpUvP6sWy96oIW59S54b+kKDz30HeMheH++NSGkOrGx96GBAebh0vryfvWSVvbd/i4HE
 Yz8wxNaNDwT+Dc+DqLhbiDH27flWa2afqkH9WN/iG0Iv7ieITRo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/25/19 3:59 PM, Dariusz Marcinkiewicz wrote:
> Hi.
> 
> This looks good except one comment about the ioctl.
> 
> On Mon, Jun 24, 2019 at 6:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
> ...
>> +static long cec_adap_g_connector_info(struct cec_adapter *adap,
>> +                                     struct cec_log_addrs __user *parg)
>> +{
>> +       if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
>> +               return -ENOTTY;
> I guess access to adap->conn_info needs to be guarded by the lock now.

Good catch! Yes, this needs a lock.

Regards,

	Hans

> 
>> +       if (copy_to_user(parg, &adap->conn_info,
>> +                        sizeof(adap->conn_info)))
>> +               return -EFAULT;
>> +       return 0;
>> +}
> 
> Best regards.
> 

