Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65A415125F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 23:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgBCWe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 17:34:26 -0500
Received: from outgoing3.flk.host-h.net ([188.40.0.89]:60667 "EHLO
        outgoing3.flk.host-h.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbgBCWe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 17:34:26 -0500
Received: from www31.flk1.host-h.net ([188.40.1.173])
        by antispam1-flk1.host-h.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1iykIP-0001v2-CU; Tue, 04 Feb 2020 00:34:23 +0200
Received: from [130.255.73.16] (helo=v01.28459.vpscontrol.net)
        by www31.flk1.host-h.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1iykIM-0000k9-VQ; Tue, 04 Feb 2020 00:34:19 +0200
From:   Justin Swartz <justin.swartz@risingedge.co.za>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Justin Swartz <justin.swartz@risingedge.co.za>
Subject: [PATCH v4 0/3] Add rga to rk322x device tree
Date:   Mon,  3 Feb 2020 22:30:28 +0000
Message-Id: <cover.1580768038.git.justin.swartz@risingedge.co.za>
X-Mailer: git-send-email 2.11.0
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0S9sfM/nP8gxoqs1zeWkeM2pSDasLI4SayDByyq9LIhVuTLiRoIJbWVM
 VDvK+OR4bkTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K7uDjV/sFUXQr+CDrNQuIHgQg
 mAX8Bxy/iUu0ThNZg0h/RxVysY5Ye6+GGw0VqdJD7ren9RtRNyYim5e3GD8LGfWrcbYvelpuN/Pk
 qhBpvAyWwieZyauFYqHkIbFa+ipF21HJWO60ZqrvKy/1AXUV5oXt6ymoFHaG7BQtEYvFCSrK5j1T
 Po5/LpleUgQM5/MAHmDvzkMd4joYqrUfcPIQdUYI3fUXyt8g6v09xrG7vu/fdUS1M5thdxxsnOTC
 rRmvZNXA7urqkuRkjn1fyteVYP+HXs9CMbFn9vCz9Z+lGmDQvQDDheqH4lBQpR0ziVlLWDAC1vRC
 hq319+C3vxdCgsyStZRkQwmoMeUp+gQglixgZmTW6H0Uo/QzUeaLOBvNEC1g+U1SXfUhLsTk5wUY
 WaWokZC3JOaEfAcg3rPhhffuvzdjlhFBwXCgjBtoYe8eg5nlaTNYebWa2W6GbNvgwptlhJrsz+8j
 XuMdjIbLZhwoK/VzePATsXS/rFxRypFKMiPLyoQzvILSDO18VtgBXTa3ez3cHoqTWBKuYika623Y
 Ta6/LJzl4pg0ZC9q5gYH7EOMauBWC98ol0xUHcbfIJ9ZJ7PpnPxGejDS+HAMyOjpxOsB8gG0slV7
 ra6jI4BS3XLmxFz+88FWeB7miCnFrS+xkiYMmdOwRIKnLhTyDa49KiI6ApkBL1M2pjeIsNv0i2bz
 nHJ53CHS5fL+CC61pH+Mdi8KDLlrJjQEyoQkvVqjwoXSktopqY7X3mJE1vuavCrJPmnnTHzVkpyb
 MK7ZTZV8hN6hngxqNW/p6/rAjB3Bo9WPi4IE45J8SMIBWsA7tm+5pSj1YjV94R3x16NaT9yCB/zW
 LYsk4/ealtlYzK51KubfNuS9lgsouDG6gpp8iIlTfpXH3eJ/htNFsfRJILGw3FQKlZKPu21J/MuB
 4XqWHsbQ5DjCOMluv3aOz8NW0bDnfSypVfNnD/ody8wcCN83CNy2/HP4CS/B6ymwJqdrYqktDHCy
 f2KOgPWiC6z4HnV1R/vfaN0C4C3KdSxIKbHYhXQwhXELIBZC+BuxdgK5cVvzDCtuQClUbi7eRJvI
 lX3taZxyfrmN0VTHLZteW2tmp/7PDtVuzmh0F4WifHSVhLwCLj5UzlqDZIb7xEp3klSpLYn5Sshm
 tRDo/ib6qUd+ON9Iwv3fqFcmzUrJkUoL/PyVSe2/DDFq5n7HBuKWYRb2mL6sFaAAW2m3yODQWZ6C
 UzN46xT2FnDD31r1QFs2yPRk3H1E4ANRdN1BlPI5cpunCmbc5xpJVMDSneyWOiQlotRPFwUdX67F
 3JAjgow=
X-Report-Abuse-To: spam@antispammaster.host-h.net
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset aims to enable use of Rockchip's RGA, a 2D raster
graphic acceleration unit, on rk322x based devices.

Changes in v4:
  - Add a compatible value entry for the rk3228 to the rockchip-rga
    device tree binding documentation.

Changes in v3:
  - Relocate rga node to the correct position in rk322x.dtsi, as
    indicated by Johan Jonker.

Changes in v2:
  - Remove unnecessary "rockchip,rk3228-rga" device tree compatibility
    string patch, as advised by Ezequiel Garcia.

  - Use both "rockchip,rk3228-rga" and "rockchip,rk3288-rga" in the
    rga node's compatibility property, as suggested by Heiko Stuebner.

Justin Swartz (3):
  [media] dt-bindings: Add binding for rk3228 rga
  ARM: dts: rockchip: add rga node for rk322x
  ARM: dts: rockchip: enable rga for rk3229-xms6

 Documentation/devicetree/bindings/media/rockchip-rga.txt |  5 +++--
 arch/arm/boot/dts/rk3229-xms6.dts                        |  4 ++++
 arch/arm/boot/dts/rk322x.dtsi                            | 11 +++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.11.0

