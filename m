Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC951151280
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 23:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBCWno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 17:43:44 -0500
Received: from outgoing14.flk.host-h.net ([197.242.87.48]:58217 "EHLO
        outgoing14.flk.host-h.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgBCWno (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 17:43:44 -0500
Received: from www31.flk1.host-h.net ([188.40.1.173])
        by antispam4-flk1.host-h.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1iykRP-0000rs-Bd; Tue, 04 Feb 2020 00:43:41 +0200
Received: from [130.255.73.16] (helo=v01.28459.vpscontrol.net)
        by www31.flk1.host-h.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <justin.swartz@risingedge.co.za>)
        id 1iykRJ-0001Vj-NY; Tue, 04 Feb 2020 00:43:33 +0200
From:   Justin Swartz <justin.swartz@risingedge.co.za>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Justin Swartz <justin.swartz@risingedge.co.za>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] [media] dt-bindings: Add binding for rk3228 rga
Date:   Mon,  3 Feb 2020 22:40:15 +0000
Message-Id: <4e66b3f029c56d7c7709d39ed15894b86f51fd37.1580768038.git.justin.swartz@risingedge.co.za>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1580768038.git.justin.swartz@risingedge.co.za>
References: <cover.1580768038.git.justin.swartz@risingedge.co.za>
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0S9sfM/nP8gxoqs1zeWkeM2pSDasLI4SayDByyq9LIhVqbrFGdjgeSyW
 oSIHDV2bc0TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3K7uDjV/sFUXQr+CDrNQuIHgQg
 mAX8Bxy/iUu0ThNZg0h/RxVysY5Ye6+GGw0VqdJD7ren9RtRNyYim5e3GD8LGfWrcbYvelpuN/Pk
 qhBpvAyWwieZyauFYqHkIbFa+ipF21HJWO60ZqrvKy/1AXUV5oXt6ymoFHaG7BQtEYvFCSrK5j1T
 Po5/LpleUgQM5/MAHmDvzkMd4joYqrUfcPIQdUYI3fUXyt8g6v09xrG7vu/fdUS1M5thdxxsnOTC
 rRmvZNXA7urqkuRkjn1fyteVYP+HXs9CMbFn9vCz9Z+lGmDQvQDDheqH4lBQpR0ziVlLWDAC1vRC
 hq319+C3vxdCgsyStZRkQwmoMeUp+gQglixgZmTW6H0Uo/QzUeaLOBvNEC1g+U1SXfUhLsTk5wUY
 WaWokZC3JOaEfAcg3rPhhfcX+ST1SQvvWvLhLE4Lpnngg5nlaTNYebWa2W6GbNvgwptlhJrsz+8j
 XuMdjIbLZhwoK/VzePATsXS/rFxRypFKMiPLyoQzvILSDO18VtgBXVZLiWGA8pLp3rHN0URF1jrY
 Ta6/LJzl4pg0ZC9q5gYH7EOMauBWC98ol0xUHcbfIJ9ZJ7PpnPxGejDS+HAMyOjpxOsB8gG0slV7
 ra6jI4BS3XLmxFz+88FWeB7miCnFrS+xkiYMmdOwRIKnLhTyDa49KiI6ApkBL1M2pjeIsNv0i2bz
 nHJ53CHS5fL+CC61pH+Mdi8KDLlrJjQEyoQkvVqjwoXSktopqY7X3mJE1vuavCrJPmnnTHzVkpyb
 MK7ZTZV8hN6hngxqNW/p6/rAjB3Bo9WPi4IE45J8SMIBWsA7tm+5pSj1YjV94R3x16NaT9yCB/zW
 LYsk4/ealtlYzK51KubfNuS9lgsouDG6gpp8iIlTfpXH3eJ/htNFsfRJIBENKYpiYAj5ry18Gfzy
 UyGWHsbQ5DjCOMluv3aOz8NWzD3Mi+V2OEt0i8esRYoCB983CNy2/HP4CS/B6ymwJqdrYqktDHCy
 f2KOgPWiC6z4HnV1R/vfaN0C4C3KdSxIKbHYhXQwhXELIBZC+BuxdgK5cVvzDCtuQClUbi7eRJvI
 TkqtzdSFBbSbobZulyTUYjC74vrhaiUYgcoraGjU35GVhLwCLj5UzlqDZIb7xEp3klSpLYn5Sshm
 tRDo/ib6qUd+ON9Iwv3fqFcmzUrJkUoL/PyVSe2/DDFq5n7HBuKWYRb2mL6sFaAAW2m3yODQWZ6C
 UzN46xT2FnDD31r1QFs2yPRk3H1E4ANRdN1BlPI5cpunCmbc5xpJVMDSneyWOiQlotRPFwUdX67F
 3JAjgow=
X-Report-Abuse-To: spam@antispammaster.host-h.net
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Indicate that the rk3228 rga is compatible with that of the rk3288.

But if any rk3228-specific quirks are identified in future that
require handling logic that differs from what is provided for the
rk3288, then allow for the compatibility string "rockchip,rk3228-rga"
to be matched instead of "rockchip,rk3288-rga".

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 Documentation/devicetree/bindings/media/rockchip-rga.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.txt b/Documentation/devicetree/bindings/media/rockchip-rga.txt
index fd5276abf..c53a8e513 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.txt
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.txt
@@ -6,8 +6,9 @@ BitBLT, alpha blending and image blur/sharpness.
 
 Required properties:
 - compatible: value should be one of the following
-		"rockchip,rk3288-rga";
-		"rockchip,rk3399-rga";
+  "rockchip,rk3228-rga", "rockchip,rk3288-rga": for Rockchip RK3228
+  "rockchip,rk3288-rga": for Rockchip RK3288
+  "rockchip,rk3399-rga": for Rockchip RK3399
 
 - interrupts: RGA interrupt specifier.
 
-- 
2.11.0

