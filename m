Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308123457F6
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 07:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhCWGqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 02:46:46 -0400
Received: from mail.ispras.ru ([83.149.199.84]:54856 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhCWGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 02:46:13 -0400
X-Greylist: delayed 527 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Mar 2021 02:46:13 EDT
Received: from [192.168.1.48] (unknown [185.13.112.218])
        by mail.ispras.ru (Postfix) with ESMTPSA id 6C57040D403E;
        Tue, 23 Mar 2021 06:37:24 +0000 (UTC)
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
From:   Pavel Andrianov <andrianov@ispras.ru>
Subject: A potential data race in drivers/media/platform/s5p-mfc/
Message-ID: <41e6d823-36df-4d9e-fd5e-beb109db37ef@ispras.ru>
Date:   Tue, 23 Mar 2021 09:37:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

s5p_mfc_probe[1] registers an interrupt handler s5p_mfc_irq before compete initialization. For example, the interrupt handler operates
with mfc_ops, which are set up in [2]. So, potentially, the interrupt handler may be executed in parallel with initialization. The question is if the device can produce the interrupts. Its registers are initialized in [3] and there are nothing like "enabling interrupts". So, likely, they are activated. And if interrupts can come, then this is a data race.

Best regards,
Pavel Andrianov
Linux Verification Center, ISPRAS
web:http://linuxtesting.org

[1]https://elixir.bootlin.com/linux/v5.4.106/source/drivers/media/platform/s5p-mfc/s5p_mfc.c#L1299
[2]https://elixir.bootlin.com/linux/v5.4.106/source/drivers/media/platform/s5p-mfc/s5p_mfc_opr.c#L19
[3]https://elixir.bootlin.com/linux/v5.4.106/source/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c#L2229

