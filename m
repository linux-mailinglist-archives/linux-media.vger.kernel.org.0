Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA80359944
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 11:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDIJdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 05:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDIJdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 05:33:31 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA5EC061760
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 02:33:17 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54f84e-110.dhcp.inet.fi [84.248.78.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 579F31B00101;
        Fri,  9 Apr 2021 12:33:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1617960794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=T8/QfsHNnSLBZ1ugPqUyVMnP/1Q8b6ZNYZDqQUAMl0w=;
        b=o3DDmT/qxhwMT+QuCWTlUeT2oXzrB/WExtCJQJqDoDsH+rk8ierctOp5/Ils3UiYEWHjye
        BU1J7XnQRI2t3/3hyuSsmt0fPiG2PeRfsJoFuanUFcP4UzMAsEB+vhafCehNGpw2IHB2oM
        dydLQD/Q4GbAnkmrrwRC4UNUIICnOPajAwsjNqxUN+X2LNvU73oZM72MXNTziToW85acbM
        VGrPoW4IKKXHCBlcdT1tGbKvid6BxKCp6bjtLVV1yDTGQmmJ6SI8Lfslf45B1ri0NxOmSy
        QVTxg8UKn1D9/FUknfe9MYbcXZuN/FjoOZA/WDSw3lsRRnr26ZFq3YYFR4r74g==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8CA4A634C87;
        Fri,  9 Apr 2021 12:32:40 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lUnVq-0001Y1-8u; Fri, 09 Apr 2021 12:33:14 +0300
Date:   Fri, 9 Apr 2021 12:33:14 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [GIT PULL for 5.13] ImgU fixes
Message-ID: <20210409093314.GF3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1617960794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=T8/QfsHNnSLBZ1ugPqUyVMnP/1Q8b6ZNYZDqQUAMl0w=;
        b=lnxnLceLC58vRNx1lY6bdUZXhIoRTNwsC8/pw3qXq6jsKeO4SNV+rPCdg4cnu7RdC6s4Nm
        MaaUuo/C49uik+YXz4SIWO+cRzxp8vm4CGM8MfyT43L7YchQ88/DnvRhofJ0/vKK9Z7F5J
        it1L3rRNP9q3N53gMh8wheMWwCcIMl33RbIe3YE5C9GRjKioRi4eQcmZOYeMhyiWoQS7Lg
        9+hGggPwEWzRpBNTNVwDMS835HCwbvpCjVtf3VER5Y/FOs+vskvgsiAKhfa5jS9ptdSFzJ
        bXl7s7tidvdHO7KHxjlWAf/mGCGHxcahQgyKwlLHxVCNG1oF6rHXXvkQgyJ1gQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1617960794; a=rsa-sha256;
        cv=none;
        b=P325ednnz4th8RbLYyg1c4lngl3S6Wwira5hHs3v2CNSIUodsbVYIxpuPOKtIE1r1JDqJs
        6+LhB64/t5UzyQWu9T+dVY1YC4PLAyyNx8/+2aPc7pwqxDV6ARIq1xdrzNFWCRFz11hfPS
        rQMekdwkJmdQxo+JdExyyLN36Knev1o4pERW+BCoFS1hL+YS/loEQrM6DR+H3ENnG6lE5+
        hEVhcpH0XQP41JuPMO/4shoPRU6oMaQ+jNwNLeO7uP8fy9WAdEbkaRTJwvAjvmXzbUsrGR
        4/zrbZ/ezd2dEnh4kr3JNmpG5cCauob2Gznkg3rNYK+UzvvMf0PfmIdgAfRjCg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are two fixes from Ricardo to the ImgU driver.

Please pull.


The following changes since commit c1c1d437b1f0a84de6b53416026f7ea1ef3df996:

  MAINTAINERS: update ovti,ov2680.yaml reference (2021-04-07 10:01:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.13-2-signed

for you to fetch changes up to cf20c685d047ca5cac7c58584e20a99759e761b9:

  media: staging/intel-ipu3: Fix race condition during set_fmt (2021-04-09 11:52:31 +0300)

----------------------------------------------------------------
IPU3 IMGU fixes for 5.13

----------------------------------------------------------------
Ricardo Ribalda (2):
      media: staging/intel-ipu3: Fix memory leak in imu_fmt
      media: staging/intel-ipu3: Fix race condition during set_fmt

 drivers/staging/media/ipu3/ipu3-v4l2.c | 41 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

-- 
Kind regards,

Sakari Ailus
