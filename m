Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317B42643D3
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 12:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgIJKXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 06:23:51 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36801 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725887AbgIJKXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 06:23:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GJjykZHBFPTBMGJjzkQoiT; Thu, 10 Sep 2020 12:23:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599733424; bh=CbVywzRhTwESwTLncavT0QOmGghx5xoDHScuLakxdAg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fjv+fthr0z+fWLqk/saFqMJwPludDCUjwvWTedb3L16Vu7PX/MPccgt/B1gRDrYAc
         7sHQpHtccd2GVqK7zMn+/BqzcFfxn9UJXYMPuVRN4yvdduRagU4JAsoBniY1R53EpJ
         rp1vi4KyH2+aCuyR231CfVuCQBmS0Z82CcMQH1+moG6PNCov8NIy8UYFa+m8vBDKEn
         TWJCqaKDoRFnCtgCXlvHb3mrJENaS/f2ta8gUb7iTwyqKFFS5gJatsxCBHlgyfSrb9
         BvJE7dElT+3ymi5Li6x50pzYUyb8CNPu86lO6pfpyMlTfqr1fuMTa2UwQnWr+poCBk
         mvS+xMaDkuTPw==
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
 <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
 <20200910094921.GB97481@google.com>
 <f92991e1-e0d7-69ca-9541-1546bb139dd3@xs4all.nl>
 <20200910101431.GC97481@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <257cbc46-84a0-e7bc-10c8-d08d3e395d1a@xs4all.nl>
Date:   Thu, 10 Sep 2020 12:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910101431.GC97481@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM7Ra6p3Jyqxv7W+xDLc98yw+tw+AKF0Qg3MBVGA02lxjo8bqeX7Y1NPjnYUaGU9upiJzdO826cgl4PvvnMIUKVtLQiDd866YY7q9MgVBDf8+sKXAo1s
 z+2eEOq+MyS7yuIyi0/qyS80/opBYJ0a2uI1dLzO64eoJz6esZGvy6gu211Iorh9ZfKD5PAEhy0tThW6KqrbFkqWVaBCdvLZP6x7ucTXHxWdtOCYzUwkwKDf
 eGn01eSzcuexKRT7nn3qPlx0B+KA2sOH/byVi0F0gksIF7vymgMEQcmJL1uMwawAJzXXkfxCrmUXLwVNyTxPw0t8JmgX2irAh/Kxw5gKhOFPIF5ScNWknWuQ
 Rl5buj+2dHw8XSpz8cThaDz6qsEhVjlpjhUITPWdIEhsnIGbJsSozMTVCxgubXKQPtOAO2hOSHQkTB+U9FHXe8RfzkjEwLlOz20I9kjcrXmpHelWbOXI0aNA
 zl4Na7QiXUMn+zEF
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/09/2020 12:14, Sergey Senozhatsky wrote:
> On (20/09/10 11:57), Hans Verkuil wrote:
>>
>> Perhaps, but this patch is meant to revert *all* changes relating to
>> V4L2_FLAG_MEMORY_NON_CONSISTENT. We don't want to have unused fields
>> in the public API.
> 
> OK, would you prefer a squashed patch for all the kernel rollbacks and
> cleanups or a patch series?

My preference is a single patch.

Regards,

	Hans
