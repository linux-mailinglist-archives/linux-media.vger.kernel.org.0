Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD6345931
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCWICE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:02:04 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36137 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229472AbhCWIBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:01:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ObypluSUuUzyrObyslOdKT; Tue, 23 Mar 2021 09:01:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486499; bh=giTilsE2ULYBFBVgirpRPuUs0AOg0L0uCkqxwbIcWxk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fF+nWJ6dCzQMQY2kH4x+k89z7KMFtEMJv53/RLuYLULjJQwI6ca7Hyq+bv3C8ljEV
         VbbBRb5G7z4rQfsP7k6CiIgCGBremhhqdpfyd8A5rg5lQPAgUoFpHVRNFjY2R/q0Js
         Z9FwfQjboo6w0iVND+/dZWMyo34b6c2XmxCfhc/1NKc1t61+98ycSmwzHnOA3ypBBn
         NWn+H+bPfkHJIMXWNU34g6ymmCu+h+AnwSKmhjwmxDUP7tYE34sbbIuXd6DaA+HOlE
         o+g9+Ubul/wodYcYX6n3I7l6OBekkRO2T2/NBuu1yPX4ttQtC9JmwFRzU5pabwtCHZ
         U7FnlA8XGfkcw==
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these hantro kernel-doc warnings?
Message-ID: <3e517f8d-3e62-0bf6-0a8d-e82cf67541ca@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKrwVHSoG/wOqMwADEGvMo8/vQKDRxGqoO/cczcn8XR/gA94tJC18tc6+hnuh/6zE8YTTACjYmoZGj+vR2Ldn6m5XjSoyMVdP2s/wIOkcL61av5FW7Hn
 5TGwykze10fUIPuskwiDObq0EqnfqfMz3R6aQC6jEJb5a2bbU2yBFJ/zikpy6e1xwCs4sdissv+ZmwPXKokApl1KpZg6rFnsuvawLiqe8ZR4QrKDh4E0eY3T
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

Can you take a look at the following hantro warnings?

drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUV420P' not described in enum 'hantro_enc_fmt'
drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUV420SP' not described in enum 'hantro_enc_fmt'
drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_YUYV422' not described in enum 'hantro_enc_fmt'
drivers/staging/media/hantro/hantro_hw.h:149: warning: Enum value 'RK3288_VPU_ENC_FMT_UYVY422' not described in enum 'hantro_enc_fmt'

Thanks!

	Hans
