Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6D046D8B2
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 17:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbhLHQod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 11:44:33 -0500
Received: from mout.gmx.net ([212.227.15.19]:51599 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231559AbhLHQod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 11:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638981656;
        bh=/Cpt16y1T+ViVKKDb6AGCPJtkWKlkckWfn0aGZ0XfVw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZU+MKF01dILswpVSE2IYEh8jeUYfNlJaeyVHukgRZia4znABWxrPE8Ljq+hQs0JBW
         NVp2ZSE7FNnBUpDRko4NJY5+zh5GDcFUXyjXoT/0hZRt+l8KE6+mVivKciwaIVr3Lc
         MS9+5s11pXLZ2tnd4mySOPklNCTxCCilxFjSUTd8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bs36.server.lan [172.19.170.88]) (via HTTP); Wed, 8 Dec 2021
 17:40:56 +0100
MIME-Version: 1.0
Message-ID: <trinity-6e9f5250-2524-47a2-9c0b-ba5ee2346cee-1638981656579@3c-app-gmx-bs36>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: si2157: move firmware load to a separate
 function
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 8 Dec 2021 17:40:56 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <dc8d0be6a9756bf65371e2e1e0a8062df74f0e5f.1638958050.git.mchehab+huawei@kernel.org>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
 <dc8d0be6a9756bf65371e2e1e0a8062df74f0e5f.1638958050.git.mchehab+huawei@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3KuxDVtlZzsL3N+py63e2anm0fv/DFJU4GeF6RF1THZxjMgk6qjiF4t20q9qo5wIhEU+V
 Z/Mhhmd9YiivJsSryl/B/NtB6W3w+UstuKq/Igjls/gvAmV6G7sC78uYqGcPm2Yr22z+mIr+1yUl
 d4iymYxTgXcK18fLhDH5xozeFIzLhnuTH9MmfeonJqc6jLZo89xarWYHYiZY06H2Sessve7QoiVO
 wUCEPM8/U01Xfc6hEtnKIccT/k+AxNOEgG32FDPpLw51wCC0p6vT+n/zBrhvNxmlmAS22MLVOCe8
 aQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+3ci4OXChc=:zT4Z7hT0wsEtjgrYyILYkX
 dLlaoHnaxCkWNB5jzNBsqojS/pznFWBz6CPEoot5BEECsrqV0wCycBWnCu/Ri7yHWeVqNFW/+
 ZNJv0yfg9bhN+AsM4N0xbkVd77BMyPd7yAQg2FH+RvfrDLIzaXGDZLsMMJI2/M7y8UoRDEVhZ
 7D06RQWWdTW47JecfmLIlTaQbnYYIndwxFhpQUN9rlfNXmD8tweMDi/XV8piAdNwlka8jmob1
 hh51y3OEngKllTgX4fzYLmd7AvCdR8JKxEmzBCrOUnSubU80wIGD8LMcVfajgASjgRAeZoDN7
 QEmDARhvCuWtEObyV2ui0Y9ZYbUMPxSnOez/TTZ8Ye0MuHGfy8Lfv2qSAW4alWhBwRDS8DQXX
 aAA2kUlgf2fKJF0cRIDkS52cg0XDgyJpPTwoknAMjiJINbgFYEeIOQJhvmZaqaVWzgASZYnsH
 3lRDoptKjfVGT4QQPBaKyq5ix99vKWHGkttwZf6fdmO/+USOxBh9vb05lRjVfy5ogh8FPdXwZ
 6A9rSB/ecKFbW7cHlqniClgedN7onFtagcgDRdOusfiaM9dQ+4cvbfKeacwfokkojpb1aPSCh
 9CpwL0lkrf5NHmN91BCuzbhjJz7UrEC60DpjHdxUCromLexRFDqwB9H4/HDo9U66j+NRtnOCm
 FxWNtsDYLDcAQKAmKPkUv2k56+iAUiP1NoHejSL4/IrjoxO/qAplpnAw17bO0WP0FuV975Sd3
 7tthw3SaT3qZU/nuXDr5RH5X0MuU7sK1rsj28sEhSupJRp8JLNfeVet/AYMA4RjuEOGJ8zwNc
 bbEvi/+
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> @@ -181,45 +228,13 @@  static int si2157_init(struct dvb_frontend *fe)
>  	if (fw_name == NULL)
>  		goto skip_fw_download;

You can invert the condition now and put the si2157_load_firmware() call
inside the if () block, and do away with the goto.

> -	/* request the firmware, this will block and timeout */
> -	ret = request_firmware(&fw, fw_name, &client->dev);
> +	ret = si2157_load_firmware(fe, fw_name);
>  	if (ret) {
>  		dev_err(&client->dev, "firmware file '%s' not found\n",

This will produce duplicate error messages, because the called function
will already output some error messages. You should move this line to
the extracted function as well, and reduce the code in the init function
to:

if (fw_name != null) {
        ret = si2157_load_firmware(fe, fw_name);
        if (ret)
                goto err;
}

Best Regards,
-Robert Schlabbach
