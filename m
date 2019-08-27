Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2A89EA74
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 16:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfH0OKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 10:10:05 -0400
Received: from mout.web.de ([212.227.17.12]:39099 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfH0OKF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 10:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1566914984;
        bh=l1aL+K+MTmEGnSVe+8VDSK+N6OAIqm0nzOkK7urvvyI=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=BtxxokAdOS/PJDzDIzndiCckhZUoY/2RrHRuzvBwpJGO2GNaTYiYlX3PqHZ3DaLwh
         y6/GMya0YGRxZM/Mf1p2TEx0xR1nKgowfkcp128/Z++EVsZZLTGkns7+u/FYTg3Kgo
         +ovoIkPM8L2mAphYhqBrE5AMWNOs124Q4Ia+FtJU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MMn1H-1i8Mvn1KO7-008eQ0; Tue, 27
 Aug 2019 16:09:44 +0200
To:     linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] media: stm32-dcmi: Delete an unnecessary of_node_put() call
 in dcmi_probe()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Message-ID: <129a4933-2171-7ed9-c84c-8e56b6d05270@web.de>
Date:   Tue, 27 Aug 2019 16:09:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wr+0Yoq1oTTqd2b74+1MXlD8ChSnZMKnD9uHZyqlQ9Z/2KtKofM
 ZxklWMMNeYd4egtYrECUjV1d2hAQxLgmQbNNnTsRmoHnM9LCy9+51WA0VoEWoaJjmxGib8W
 9aIE5rqdp/RDjJx7Mmc53U5BhA7Y9AZgHfv9YyYr08WqamvuAIfeJpk94jRpYtU0sQy+rsx
 BW21EnhBXgpRR3MlhQ3NA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3zFpzUDWfE0=:H9zsFmmkBknJO7OBxyEex8
 PHU6+T/nl8AHourGcb43Y8An0nDclKu6mMqedisfGNqvMcp/MypENT5YWmOFozONCUbeKxmjo
 mLVo5BDLJFqhB6FNefrKdMUSIxcj2NNQR46ezg2vaLMwm7sdIhb/4u8qphuFsKUd+nmV+7ic6
 oIj+tJ4Ic8p9jcKd0m4dQS0DGjio+gqKJecjvRsMCV64ceZBLZCtKBiXHtsbQKFpiBOmyqeJe
 4SANiNcu+JinQfKSIe48JW2lmyCh8cAZxxdqqCGuh/S1XVG8p5fTYFtfQHWCG6HDEdV9q1rhc
 RFBtjecOJqGB8z+wZMxBfe1mcmcIcUMU6uXL4qVJkdca2SyjDATNwZUu6vJdC/acEp2WR8jJp
 //7B9O8h2YikTPC/A1ayQ2JARH4S29WnusSOPtWARAdQy9bCaUa+2J5R9XrJqi71W+qMBi7WA
 Yy1x91h4S6NkDm8Q8rcTSTzV24vOXZaD+yStKLVThHleAiiyDU5YtUG04GvVk5lmaEvVT8gnQ
 18RgYWv7KfXSShkFmJejwljB47yolhYH8bwY7E0BpU2xNI2PniyRq2/XebVNM7nkYZcnMgpbs
 W2BAhQRD6IlMRKOY0OPkoYFrp60I8GA9CEcnpkMpRu1oGUosvXwZGyLxEbHD5hl/fK4WzGF7s
 3PX6hl5z7LmGCQWzURFy3MnBBEe3I8BDJzjdh9Git0xqqZAvS7nSof3jyUjm+3WZ7LmdCaTV8
 mDVBlsZvDd3PN08yaB7VltJgpUc9EFTQ9uVUuivysZntAFNLvT8lmaieXdZAUL1X1AV9B4TEH
 C0y8STwYFbII2g3KXzBugQ4hlrwBLJNqFhZS34+at8/alizPE0YO0+AZSkLcM3UyFRkOucr7m
 X+26RAp3mVCEHbiNwDKcc+4aqbCHjfHzUMwFpfxnEV/uUbAGJTZ24TKkxjJy3yORjE83bud7b
 C21Ffbytbi1J6D6QzvLgL40KsxEla28pX9d56dZ0lV1OYXDBIIEcX4UXrxOa9yVYBSQiewnya
 TBv4B0MzO6hA8xLmOU/1GasQoSGf+my8qYOjQEReeOHqJbQjCDg4CXUefLLMVGGwqB63lKMmr
 kE0fuwAaBDM60vUG3s4I0XSuWn+9o9Qt1S4DB7UYt0XVoac2TgtLItDCyZ3D5y3MKuWoGZT0P
 Ik338=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 16:00:13 +0200

A null pointer would be passed to a call of the function =E2=80=9Cof_node_=
put=E2=80=9D
immediately after a call of the function =E2=80=9Cof_graph_get_next_endpoi=
nt=E2=80=9D
failed at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/media/platform/stm32/stm32-dcmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/pla=
tform/stm32/stm32-dcmi.c
index cb1daf8217ff..9392e3409fba 100644
=2D-- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1861,7 +1861,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	np =3D of_graph_get_next_endpoint(np, NULL);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
-		of_node_put(np);
 		return -ENODEV;
 	}

=2D-
2.23.0

