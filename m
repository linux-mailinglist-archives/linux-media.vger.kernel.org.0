Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5500010552E
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 16:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKUPTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 10:19:07 -0500
Received: from mout.web.de ([212.227.15.14]:49181 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfKUPTH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 10:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1574349546;
        bh=vHrSz8JTxr9cJtjsi2oKCNygllLbwCth1bQhXL8u9kY=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=prGrdUYVfdbNopgGBsyAjGYXibtbMCmKMTGrOGOt+O9f/Rb7ZxtB24Ldiszi1HzsL
         vNmhL8JQscVXn3qSpsULy/C6GkAbDs5rYzU5xmDw8U8oUgAXnaK0RzCz92Ib6ukTEW
         8mM4J+AC6mQXmyWtyf0bhZxiiaiPN9QWp2OaHBgo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.214] ([85.233.38.157]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lhvko-1i2Itn3mrq-00n7Pb for
 <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 16:19:05 +0100
To:     linux-media@vger.kernel.org
From:   Johann Friedrichs <johann.friedrichs@web.de>
Subject: [PATCH] dvb-core/dvb_demux.c: Fix receiving invalid EIT-sections
Message-ID: <d6cf94c7-f3e3-cb41-55de-e982ff9f50ab@web.de>
Date:   Thu, 21 Nov 2019 16:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CpCqBHHy7ZfhgIrCTHsw6niQ44GGJzLAdp7pZLhE7+oFTZihQcX
 gjg8dQYU4+WL5FtYn6VtjfMwNwzwxnLJ67BAqGDePexGAWB8JBtf3+vwb1CDz3rXNhY4A8X
 APLFJhfnR0sWHaZndiIxksQbtD7rqAsl/PbECo19cH/2VzMJGAIJEaWjZ7pGqQC/wSlwhju
 GOs6Ce/SOXqLf2Y50qTzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2lbwcgLdT/E=:K5wz4wMCWJZbW9Z3gJ9+3K
 jZnIV0nC7Kmn0vqEAxKe5MJt7xCvq9QDwoHOx4WHxhB6Si2zjJsaC8BNLxkCl6da/WBuhCKKb
 qaj1wnlDs7GxBMbuTmJZqnVJwfLewK1dVvRbNSds6SOZ0iKU1azbkkS36tAxlAohexcYwzqFn
 jLvnIp2nRIZtwpWuCXcSJjr/fvXTwnExu6eqX1Q/WMMiQWupW0iyral8nJn/I0tit+kLfVEu9
 X4Qyhw+x4F2X8Pd8s8x9pNFcm/cHw37WgjsZD0umfwuQr8yaaa3iu51j7QhMqckgkbiEJxaQM
 bwGoVrh8PA2xbHn2MXhaWAUAN768zVYNT2EyaNsU2NAHCP1e2bh1FKvL6t3knlNf2TFABPfop
 LxYf9mpJ3L8twk9rSAMSxnxOL3bubdKiMEwTncpgm8TmsWOATbqwF4uS9OABSXKgbpYZLagjm
 Pxk8JChQAU1xH0JT9ptxUe4829f4HrfffzB1Cz7RUvSHO3+bxK7OvdC7pQ08hDlEfQOWqsFJV
 IAcmANQl0xR8Y9oJyFeAIWDnpN2X54wnawAG7mab3cwKY3FdsULRbHZ4foBfgblAheAk1VzQO
 nsh8TtRxcPSrB2Nz9eU3zQL0+GdPvKY5P+p5VdXzyrOL2AArljcm6HSXKuWwPzlga06YJn/yT
 oOa2TiiLcNj9jBQWfU8kZAP/+5ajZucBdbFmZsxte99YY1RbNjT/bFs/0jFm2mjjZToc2QicC
 Z5ZhE2ojbMGxhu4av7+y4xT9kytPMJJmqYw1Z0UYZTyXi7wSzix6vJzOQMQdE5epnZ8pn6/W7
 kPicpyna073fxGbwQR1+7HZVnmJIYgXzJQSrZkrre+l1RbvTkmssuHoBbckp1WH31r6F6uzIp
 HEmnuwNYaHhD6th3y70tn/syvB7dVzwpQzx2bTji4X+TtYux/tpCH0pA3shq6mP0lCw1C3G4X
 tuyBBc5N7ceeSwF5IMXYDtW/0TLPtb8uF6TbVG07Wpi0pp4F0EkPU7cvrJCIozxZXD6v4xZrp
 ixCLWXeYj/2o2UgzdmD0mFesN5nhCi1CvyvDfRphzYaozFjGb7NspLSRRng/7OJ5p4qUA/9Yv
 Hc6v7xbapqOtTVmCjCzhCFVHRSVAPPiDFALweDW/08mSgIGft8sdpnR5H7L3JJLul5g9yjVvI
 P1N67w/hO6BPmyKRh6A5+uaTbVIR0DxfBASAZAH/w6UpPCDR8y0ozVPvWNb/jHUrOBfM9hSCn
 rxJUXtN+H0pxsr3JOARvvpflMkPCZHPKsjl6RjYhZ8lasLMUdGd0A0jWn+vM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Johann Friedrichs <johann.friedrichs@web.de>

Resetting buf without resetting pusi_seen at a channel-switch can lead
to copying the rest of a section to the start of buf, but treating it as
a complete section, when the next pusi arrives.
EIT-sections starting without valid header were randomly received during
an EIT-scan
on a transponder.
=2D--
  drivers/media/dvb-core/dvb_demux.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvb_demux.c
b/drivers/media/dvb-core/dvb_demux.c
index 39a2c6ccf31d..5fde1d38b3e3 100644
=2D-- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -971,6 +971,7 @@ static int dmx_section_feed_start_filtering(struct
dmx_section_feed *feed)
      dvbdmxfeed->feed.sec.secbuf =3D dvbdmxfeed->feed.sec.secbuf_base;
      dvbdmxfeed->feed.sec.secbufp =3D 0;
      dvbdmxfeed->feed.sec.seclen =3D 0;
+    dvbdmxfeed->pusi_seen =3D false;

      if (!dvbdmx->start_feed) {
          mutex_unlock(&dvbdmx->mutex);
=2D-
2.17.1
