Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72716345940
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCWIHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:07:06 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36707 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229494AbhCWIGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:06:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Oc3ZluVWbUzyrOc3clOeee; Tue, 23 Mar 2021 09:06:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486792; bh=JJaFPHv1qZ6zQLR7ijAnwv0Ef6CVNxl/5mKmlq/ec94=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SD0HNH4r3Wx7XUrss7zZcAa2TCSYIe3oa4DRYsNJCaFWqAGasM89aKl+Oid/IOd5g
         Z1V6YUl4RPNx1uYkGl0yFySMJ9xTGbGwAi1N+yMff/uM5PWX1Tl1grXhUPhwz8bDFd
         dOyg0HfKElbrqJNkMlOe1lRO+aDZkXqBgBA3YJnkI5r2GL3LIN6P1+K8bzBbSjEphK
         /l+WuY0cwgJFzTjQj+F+RtdpM20K2KwK7kWj+FuPYZJL0PhaQic1/mOlr1/wBrUWRK
         hoKI5/UAvQh+bLdb3vuAQJxTK0H+FqmA6RJe0ZuT+uV5bBtQip/9NWZScyTu9n0tei
         4HczkFbPt14PQ==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these venus kernel-doc warnings?
To:     Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <6a0155c4-26a7-3182-021b-2e2b44ab662b@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFwi+5nv8HdXnU7rdQcIwJ+rOFthg82GuPRriP1Tzbts2hB2tpQSQA+mSZYMkbM0ugXsV16LDWCk1VuyLT7J8GSjzU0oreVE6Hea3DCBC4PcVuZtCohw
 Wx/Pg0xrVaE+RsJUeNFj8p8e8DWPVQr+txI0Urc0mYEQZqP/Wkit2ykvMZSQj0rCP1YBZuUUcm30YkA3pB82bHOb/OXE7Lo31Of1zkVoa2kHulhWTvQb7OSd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

Can you take a look at the following venus warnings?

drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'video_path' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'cpucfg_path' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'opp_table' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'has_opp_table' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'opp_dl_venus' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'opp_pmdomain' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'fw' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'pm_ops' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'caps' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'codecs_count' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'core0_usage_count' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:169: warning: Function parameter or member 'core1_usage_count' not described in 'venus_core'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'clk_data' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'delayed_process' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'crop' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'ycbcr_enc' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'tss' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'payloads' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'input_buf_size' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'core_acquired' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'bit_depth' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'pic_struct' not described in 'venus_inst'
drivers/media/platform/qcom/venus/core.h:404: warning: Function parameter or member 'drain_active' not described in 'venus_inst'

Thanks!

	Hans
