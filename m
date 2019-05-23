Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8E32808D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 17:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbfEWPIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 11:08:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730672AbfEWPIG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 11:08:06 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24E3620856;
        Thu, 23 May 2019 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558624086;
        bh=4TA0d+rPQtFpFcdemX8bHYjtjVHYSb5XzW82G6jhtJY=;
        h=To:Cc:From:Subject:Date:From;
        b=KNXdngPdOZjVaRbGsHrCA61Wl7XS+92P8+NRhKQZK6NTUD1g9B3Ra9ajWoRbsIzjz
         QNeRGIjyfAJP/qAG4ytTu41WgMAXLbtK3ceJajT4siv5hjB/4BR0GoBnU4032cKr8N
         urP0ndV8CAAcEEC1yztd6K3bevyVF7x6DomaQF7w=
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        shuah <shuah@kernel.org>
From:   shuah <shuah@kernel.org>
Subject: Linux 5.2 - vimc streaming fails with format error
Message-ID: <9ceba30b-dea6-a337-da3a-20d90398cab5@kernel.org>
Date:   Thu, 23 May 2019 09:07:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Helen,

vimc streaming fails on Linux 5.2-rc1

vimc: format doesn't match in link Scaler->RGB/YUV Capture

You can reproduce this easily with v4l2-ctl

Streaming works fine on Linux 5.1

I narrowed it to the following commit.
commit b6c61a6c37317efd7327199bfe24770af3d7e799
Author: Helen Fornazier <helen.koike@collabora.com>
Date:   Wed Mar 13 14:29:37 2019 -0400

     media: vimc: propagate pixel format in the stream


Please take a look.

thanks,
-- Shuah
