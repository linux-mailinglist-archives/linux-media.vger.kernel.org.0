Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE8F59BEC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfF1MqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 08:46:18 -0400
Received: from mout.web.de ([212.227.17.12]:45947 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbfF1MqR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 08:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561725934;
        bh=WJ4YspNRxX3z4+SabxP1w77yIoFj91Ur5saxynC5GSA=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=g9PNJmJjZZOXkHInlSomEYyQiPLzKj3zCIJpagWCtlcgl8phIctSchAzD32ccLOxO
         +py2LaMD8O2JPH8HdQF6j5VzQDQ4IvXHkOi5WHlF7fex0zEzXL7PF+dC0+SGrRIhW6
         kdeeGjGJtTVqFnqP05JdCofFKbv6Xj5AVnmztvsU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.53.73]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LbrUu-1iNulW2Lp6-00jH1V; Fri, 28
 Jun 2019 14:45:34 +0200
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Yi Wang <wang.yi59@zte.com.cn>
References: <1561690876-20977-2-git-send-email-wen.yang99@zte.com.cn>
Subject: Re: [PATCH 1/3] media: xilinx: fix leaked of_node references
To:     Wen Yang <wen.yang99@zte.com.cn>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e01175e4-1e4d-e9d7-5e5b-ec6e2f7b5065@web.de>
Date:   Fri, 28 Jun 2019 14:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561690876-20977-2-git-send-email-wen.yang99@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G8aN08LqWn3qrvB5aUgyBJbcbpZl8TRocsYrYRjl7gs3ye8Z/36
 wAxJRNRENs5q/h2Tndz8JblC/vSaXX5hArq6qHKcn9Y88FLcubEYJGlmIBE3OnQRzx1ql+E
 O9DOK43cBEcJx8SIWpsUkfMaLhKrAmTeyTajcvI4KFV8ilM5M06bVBtA8Fhfptl//Ln+a6j
 KgY+5ARVQZLTixtOHtfzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zorQ4pzKHVk=:JC/JZi7fYOGJQQMNDBJH3P
 V7+NcblUcaqbLN6RSr4UFjx9JW06UE+QxsEB+wr+G2h1JxZDrfedFofOiunS1eqahU4Ss+4pf
 HOPMhm11BXeTSwDRQLYxz/2RiY+oSKDPwqF/ZcEr6QsKk5PIQ1b8xPFK2w9E4Vi3u5gM5Kou0
 sFtUa9sO2e+GssW7S3x5PgadSouVx9lGcwhD2TfEGkGIvnb4jIpBsD+W8fIh2AFBLBDnJdhKV
 ZakAuE58hwf7Ppc/xnnpCIdF9NtpiN6n/U/Eh4M1BV4MOyxMB9u4l/qpZoX7eQVsNdOUzAoBt
 8WvZn2e5T4e0m83p37LYdLbNX7vOlhlpZ2GZyfQsE7FLKQ38f6zcdPsgTH+dPmNrcqZ3grlE0
 coAW4/2NzaZPB7U550xNBYvkLViT+dDlhxAXRQJsFMF2VmoDppp67b4+GQ2sBwdQquEMcsgCn
 xLYIQ3G9IZW86c38L5d9Gi8L3kuJMJ7YhcHgmSbh+Ae0nGF4N7stoEb1h0Nu2ZRwKfQuJLLKD
 3PLxW4M07BEUgy1maG1Q7UC8GD232ejEY4eP3MuNXVGS31jvqZ6eCKsTzB7VbaqZWlJVMkS41
 +ZnnBkfFwGakgHqEWI1kSVx6iBCsrN75GrAOyjukxV6FX5Uf3VZpsH1UBHg93Aiwa6b1m6KvX
 6wQg+tSKCDhyOkoyifGX/7ME4yAosi/iiJEE+YFnxLRjp4iie1bawKssmTf1nA43NPVIMXVd2
 bpRJLXgT5JfTvYyGblPmaq0J5zmgUwzX2Ntb+nWSXIavAnLmFiCm4SQyeMuH3iMI2xn7UfD2H
 XemhlSsk+upCgmjNq/dND3ehK7pFDh3lfqIjjO2vEDROVhTC0T1GnRRLG8gX9f7M9coZblwuI
 bIEU9TKjoEzUPMwffPVfBwOhKN/TgwufdMqnuQ0L5C06tqJIVNbHLkK6be/8QHadzLfvhfFwc
 50R3ys4wVaL9v16nrTS5dFRr7jU4zwiBtk9TUm0S7Pcx9ZPnIlTbQD1Sc6PkAvB4wmY9thkte
 skzTQsHl3TCcPDcAeOHR7yXMF6HzjJo5G376QcWGMI8ynYiE6Q24oL6YrjzQgJQAR+sSa6vF2
 qllMX5NJIRk3io995E3m79VlzjJ9+zXZXrW
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -713,10 +713,13 @@  static int xtpg_parse_of(struct xtpg_device *xtpg=
)
>  	struct device_node *port;
>  	unsigned int nports =3D 0;
>  	bool has_endpoint =3D false;
> +	int ret =3D 0;
>
>  	ports =3D of_get_child_by_name(node, "ports");
> -	if (ports =3D=3D NULL)
> +	if (ports =3D=3D NULL) {

The script =E2=80=9Ccheckpatch.pl=E2=80=9D can point information out like =
=E2=80=9CComparison to NULL
could be written =E2=80=A6=E2=80=9D.
Thus fix the affected source code place.

+	if (!ports) {


>  		ports =3D node;
> +		of_node_get(ports);
> +	}
>
>  	for_each_child_of_node(ports, port) {
>  		const struct xvip_video_format *format;


Regards,
Markus
