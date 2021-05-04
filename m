Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D5E372A5D
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 14:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhEDMu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 08:50:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32985 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230306AbhEDMu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 08:50:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id duUolE0kgWztCduUslIJRs; Tue, 04 May 2021 14:49:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620132597; bh=Dc/eF3A4c9X62TxwSvOnpa3ffTV6fzGnkokXDjnXOxA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oryRv/9tgvyURLERIBaYxUXSMQlDw5kBS0DV3TD+UA74t5wMQpKpMyExDd/P2AeL0
         mR6FWz+Sa7Zl2jioLcziG1xk6sVZiIdoPZtv+3kozXecu6Sb+0xRVjJVLdQ/Zd5AU9
         nt4YrteRHNszbNLOC5Fg9d8wHDOi5B2OCXkC3iB05sMUd1ngTLIjN2lpLUTjFvgCru
         sOsPMRFlAXIVNXE3GC/mEixJgrmNRHoXRO31zNTa33aY5xHVvV5N0cXiEqa+ed1XRS
         QbGNV/l3V0D/Gkx6Ie6jX9VXHdRsVSzlf29KkhQ9qLMZHDhRpRJoWGqzwRQ9iT//a5
         foj0HvGivM8Ow==
Subject: Re: [PATCH v4 0/9] Microchip SAMA5D4 VPU support et al
To:     Emil Velikov <emil.l.velikov@gmail.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
 <CACvgo50-fKJk_EpY-G_SGes6-FUs=nAouzBmSN-CYgMTpoeN_w@mail.gmail.com>
 <CACvgo53Mkvx8n8RQ4BRCNWgb2wBWhyn8A2syYzHmuv0eJ=eChg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <99f08c89-ce90-16b1-bd96-1114e3ce02e5@xs4all.nl>
Date:   Tue, 4 May 2021 14:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo53Mkvx8n8RQ4BRCNWgb2wBWhyn8A2syYzHmuv0eJ=eChg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFMRMAM69sLXyWIa87bLuqtH89biH8TkKpdsukACuWvyyPEmvqSQkxFBGzP5iIu1UV90Bjr1ZNp4e5ZlgL3HqZ+v2xvrdbAM85XRLPNdwTd3H+EFhgba
 ddNsd2KnE4c+9a8nxgZipk3K5uhOcRzNEwlchvHEmgfFRCLSzJTykz+w68Y8h+85AFNDysCQTi3dgVH1tU//xoMWnmvydNs88J+TgZNlgKvyKNW/3mERFxON
 Uquyq8c6vsaiq2QvmkbCI3KdinDydKNeY1WfmnQD7Uy2HrwNtNPhKQgDeW5FyICjyo9bN9yhxpKwqZgvIaNMGj6PzxcogFo3ZLkgwUspg//4/oKvbq0XMNlN
 5swZEbwP+pFwirm+Z4dGZ0fV3dgU76AWzce3zfPk7+OEYMsfYr9Irnm1V07hNadlVVDo2yx8JwTYXUpkPNqmzbgEewQC7brRgd8WIqbY7DapUCSwxfE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/05/2021 14:03, Emil Velikov wrote:
> Hi Hans, all
> 
> On Wed, 14 Apr 2021 at 11:32, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> <snip>
> 
>> Is there anything I can do to move the series forward?
>>
> 
> Based on the Patchwork tracking [1], I suspect that Hans will be
> merging the series.
> Although if there is anything I can do to ease things, please let me know.

It's on my todo list for this week.

Regards,

	Hans

> 
> Thanks
> Emil
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=5041
> 

