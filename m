Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADD04BF22A
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 07:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbiBVGmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 01:42:22 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiBVGmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 01:42:20 -0500
X-Greylist: delayed 586 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Feb 2022 22:41:55 PST
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266288D6BD
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 22:41:53 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 52FD7240027
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1645511525; bh=6o3Qh3wriUGm5JqXnMV4+nMJfufzycvqcvnfYiD3N2U=;
        h=Date:From:To:Cc:Subject:From;
        b=cPv241OQ5RsCYzo8QX/a3IrYahHaEGQBjT7WwjI73rpEpRmi7kluEQz1LWRyo+8VN
         23uWCc7FFOa9cPTsu1IxYzF6T5s4gM7bwb3ltWhRMC553x2v0xyhGjsE2d3DBEBr5z
         SX+YMiza47oukPGeWs1LeY9rkhtSOZI4TRwE90zXFvFeRWopQ8d+YzfWB3Eppriayk
         pHzUbpuhMSz+AxYQcW4n1OHCue5L/BF5Fij8vXJYVkiXUmXwatYwpgqJ3PWiiqQRJj
         E9HmelLNsZvLj21QKHmKkd5OexlehpMTE2bVGoJk5ICb3vt8dkaE3ZQ4kGqaGmnGKU
         jKGtOVtsDDwXg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4K2q8N488xz6tnh;
        Tue, 22 Feb 2022 07:32:04 +0100 (CET)
Date:   Tue, 22 Feb 2022 06:32:02 +0000
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     dafna@fastmail.com
Subject: Deprecated Maintainer entries?
Message-ID: <20220222063202.petjwwcfctzsbhxx@basti-TUXEDO-Book-XA1510>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey folks,

I noticed that in:
```
ROCKCHIP ISP V1 DRIVER
M:	Helen Koike <helen.koike@collabora.com>
M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
L:	linux-media@vger.kernel.org
L:	linux-rockchip@lists.infradead.org
S:	Maintained
F:	Documentation/admin-guide/media/rkisp1.rst
F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
F:	drivers/media/platform/rockchip/rkisp1
F:	include/uapi/linux/rkisp1-config.h
```

Both maintainers do not work for Collabora anymore, so they probably
will not receive any mail on those mail addresses.

@Dafna: I do not know which mail address Helen currently uses, are you
aware of any?

Greetings,
Sebastian
