Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6142E5535B
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 17:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbfFYP2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 11:28:00 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42095 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730469AbfFYP2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 11:28:00 -0400
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b] ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fnMPhRB6WSfvXfnMThHxET; Tue, 25 Jun 2019 17:27:58 +0200
Subject: Re: [PATCHv9 04/13] cec: expose the new connector info API
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
References: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
 <20190625144510.122214-5-hverkuil-cisco@xs4all.nl>
 <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <157b6cee-b0a6-3ca4-edd2-629374ecf508@xs4all.nl>
Date:   Tue, 25 Jun 2019 17:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQFH4Hr4NW6U9D9RhPSAnDGDkd_C83yXyn2A1CgPOTJqkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGX8u4thUeIZOm25MGNaUjluiYenQw0xgQw2eSkNgP0Ph2wd/YrmllBBP44/3+Mz/6FxGRT3EV1+Km0/BK5Y3Foh1x3uliNhHrX4KtDKDfIuCij2FL5q
 Musw+t3VDzpmhTgW8kmfRuibD5tAHZ/6lLZkE82yi9TYpheTx/n8Dz3xSMRHKt1EneT1xo8En/LVX+SPL/lS1R/J2uz8U7RgaecBaMW9m4XSb1/xdQ7tHOY6
 JKbs6SAGsYOySvsu5NSXY9OJz4He7y1ByqJSyci1wK4OxOCKuOVjmiP7cIbxPipIjBFAnuq2qVth3VPlVh9xOLj/sHkZhQkMFQV40EsjSmpSLTXMZBSuSYth
 61jPy3Mu3cZuKwYE71mcP1PE32zUENcPHnm536Ms68PlVqyv23Y=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/25/19 4:58 PM, Dariusz Marcinkiewicz wrote:
> Hi again.
> On Tue, Jun 25, 2019 at 4:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> +       mutex_lock(&adap->lock);
>> +       if (copy_to_user(parg, &adap->conn_info, sizeof(adap->conn_info)))
>> +               ret = -EFAULT;
>> +       mutex_unlock(&adap->lock);
>> +       return ret;
>> +}
> Shouldn't the lock be released before calling copy_to_user? I guess
> you need to make an extra copy of the conn_info, like it is done for
> other ioctls.

There is no reason for doing that, it would just use additional stack
space.

Regards,

	Hans
