Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D75C3931CF
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 17:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236878AbhE0PJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 11:09:24 -0400
Received: from mail.ispras.ru ([83.149.199.84]:60048 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236887AbhE0PIK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 11:08:10 -0400
Received: from localhost.localdomain (unknown [85.89.127.119])
        by mail.ispras.ru (Postfix) with ESMTPSA id 688684076B37;
        Thu, 27 May 2021 15:06:32 +0000 (UTC)
From:   Dmitriy Ulitin <ulitin@ispras.ru>
To:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Dmitriy Ulitin <ulitin@ispras.ru>, linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [POTENTIAL BUG] stm32: Potential NULL pointer dereference in dcmi_irq_thread()
Date:   Thu, 27 May 2021 18:06:25 +0300
Message-Id: <20210527150627.12995-1-ulitin@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At the moment of enabling irq handling:=0D
=0D
1922 ret =3D devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,=
=0D
1923			dcmi_irq_thread, IRQF_ONESHOT,=0D
1924			dev_name(&pdev->dev), dcmi);=0D
=0D
there is still uninitialized field sd_format of struct stm32_dcmi *dcmi.=0D
If an interrupt occurs in the interval between the installation of the=0D
interrupt handler and the initialization of this field, NULL pointer=0D
dereference happens.=0D
=0D
This field is dereferenced in the handler function without any check:=0D
=0D
457 if (dcmi->sd_format->fourcc =3D=3D V4L2_PIX_FMT_JPEG &&=0D
458	    dcmi->misr & IT_FRAME) {=0D
=0D
The initialization of the sd_format field happens in=0D
dcmi_graph_notify_complete() via dcmi_set_default_fmt().=0D
=0D
Is it guaranteed that an interrupt does not occur in this interval?=0D
If it is not, is it better to move interrupt handler installation=0D
after initialization of this field has been completed?=0D
=0D
Found by Linux Driver Verification project (linuxtesting.org).=0D
=0D
