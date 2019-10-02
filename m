Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F1EC86EA
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 13:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfJBLEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 07:04:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:52619 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728071AbfJBLEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 07:04:04 -0400
Received: from [IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af] ([IPv6:2001:420:44c1:2577:9d1d:ff1f:dc58:e8af])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FcQJid8PkjZ8vFcQMihbxu; Wed, 02 Oct 2019 13:04:03 +0200
Subject: Re: [ANN] v4l-utils: remove utils/cec-follower/cec-log.h after a 'git
 pull'
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>,
        Vandana B N <bnvandana@gmail.com>
References: <ff10119d-4b39-8179-16f1-e6d96a345b0d@xs4all.nl>
Message-ID: <6455e9c7-2f3d-aa68-041b-ec9409afcb28@xs4all.nl>
Date:   Wed, 2 Oct 2019 13:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ff10119d-4b39-8179-16f1-e6d96a345b0d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEev6W/ztPzKry906HbxzUAJ9xyYZsWqNku5TWNwcf0xXktUoZCIw5O4LZtMC/loI9WyqxA1qeWAbREGzSwDH1X4Y+zFEFd5crjOg5m2dMp1oBL7CJjB
 VFcBL/mzs1BQq7jL9SndRs0qYH/LLW9CDQ8a7mUeW16XMQQ2KZOxI/2WPFo+5qMQU9ygp/dCuB6MXlm87FZiIg/xaeoS7y0Lg2IudlwS2vaAjg/JsKS2xMx2
 v4RyQpuIvDpaNEyvO6sN/cJ9WAMA3syt+r6vmB/X+dSp8xBjEmiRUtdvvDRRrdAeo+uH+M6vbUwndN/ZrK1bbU6EWsSuFGCPy0EyHSs5Ql32OGn3UFm+gZ8Y
 v5NUAa8s
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/2/19 10:52 AM, Hans Verkuil wrote:
> Just a heads up: I synced v4l-utils with the latest media_tree master branch,
> and that required some reorganization for the CEC utilities.
> 
> If you do a 'git pull' in an existing v4l-utils repo, then it will fail to
> build due to an orphaned utils/cec-follower/cec-log.h file. Just remove it and
> it will compile again.
> 
> utils/cec-follower/cec-log.h was a generated file, but this generated file is now
> named cec-log-gen.h. A new utils/common/cec-log.h header was also introduced, so
> cec-follower sources now include the old generated cec-log.h instead of the version
> in utils/common.
> 
> Of course, if you do a fresh git clone, then you won't have this problem.
> 
> Apologies for this.

Mauro had a better solution for this that prevents the compile errors.

But you still end up with an orphaned header that you might want to delete.

Thanks Mauro!

	Hans
