Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5DC1DB543
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgETNkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:40:07 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:30724 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726824AbgETNkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:40:06 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04KDZUki013233;
        Wed, 20 May 2020 15:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Ra6W9fZReLRTQrx+lu7bVII6kYd76LIwYkwWDAY0Cqo=;
 b=L3lFrasvXkvpYdrWyPK63OLsSj360TP3KX1jqMA1OYkfPfFg5x7bT4/Ad0J+1XuhTBY9
 6WvSEt9LMyK06Yt1nEwXV6AOFuk/fTCRZBgSqdRmC03uPiw2ADxAPEYEQ6njiJAv1fhJ
 V9yBftCK6A1UFE2Pdx5tgFvQTmR9kE0p/nMArswPm2lF6SsF3Bo6/GpffqLXvinxOAfX
 eKIEpVbyAIlCgV1i7CcJMl3KuODXi0sTIeVlCFMVsjfUK367TvdNmWbjKZXvwp/qWHSM
 toBRKt6rM74mhhV51wulH22H22wVznKZyjFqIxjPdOiyOyidIvI7mzmfbKGA3/gKTYbQ WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3125xy0jfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 May 2020 15:39:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72FE310002A;
        Wed, 20 May 2020 15:39:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B0B32C38AA;
        Wed, 20 May 2020 15:39:42 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May 2020 15:39:41
 +0200
From:   Erwan Le Ray <erwan.leray@st.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC:     <linux-serial@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        Erwan Le Ray <erwan.leray@st.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/2] serial: stm32: Use generic DT binding for announcing RTS/CTS lines
Date:   Wed, 20 May 2020 15:39:32 +0200
Message-ID: <20200520133932.30441-3-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520133932.30441-1-erwan.leray@st.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-20_09:2020-05-20,2020-05-20 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of generic DT binding for annoucing RTS/CTS lines. The initial
binding 'st,hw-flow-control' is not needed anymore since generic binding
is available, but is kept for backward compatibility.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 17c2f3276888..9cfcf355567a 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1033,8 +1033,9 @@ static struct stm32_port *stm32_of_get_stm32_port(struct platform_device *pdev)
 	if (WARN_ON(id >= STM32_MAX_PORTS))
 		return NULL;
 
-	stm32_ports[id].hw_flow_control = of_property_read_bool(np,
-							"st,hw-flow-ctrl");
+	stm32_ports[id].hw_flow_control =
+		of_property_read_bool (np, "st,hw-flow-ctrl") /*deprecated*/ ||
+		of_property_read_bool (np, "uart-has-rtscts");
 	stm32_ports[id].port.line = id;
 	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
 	stm32_ports[id].cr3_irq = 0;
-- 
2.17.1

