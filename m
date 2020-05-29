Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3584C1E8847
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgE2UAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:00:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:54787 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgE2UAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:51 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MirfG-1j2QA92mrE-00ev6U; Fri, 29 May 2020 22:00:41 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/9] staging: media: atomisp: fix type mismatch
Date:   Fri, 29 May 2020 22:00:28 +0200
Message-Id: <20200529200031.4117841-6-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9ERfkDS39QaOEAH/LNtEg5SZtZjwNIsVwGEjhU9+K4cojGf/K7V
 UoWP2n2dxRTtvmH/nsnxAotxP4hMMygcv035tiVShwjEzCZowyjapFC1LoVOT8iA6CmbgF5
 E7amGwkRPMGWe5ol9GUJdYDg3PV8fvBrPq5BepHLEg/k344kt+HTTEzVppIY3v5/Bj+7QS2
 hL4QtaQY8ORyH/lbNqluA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mnqBXKoOQtc=:6yvsMKsJ87sOKVL5KlMlyJ
 NM2zqmK1kVt+2jS4Gxf2DCxE1uHIwNMzEPOHZg8bfw9A8ElN7XJcj86IsKOGrnQspJe8esBBH
 1cAgJHipTa/c7+4aiDTe+jcZcyyzfOphFY+Be+cvvQkrlH3EhrMQPLiYssdAiYZ2rLiOzmVSY
 91wiIHYMO4N7PU1lYruPhuPnWi1E69HKFl/JjupKRaHbvyi0McmAqGs+VCH1rQLdv6uoqtT2e
 3fI3g2RXvBG1vz+YLkhDXZjbD5bCOiDU2dZ95yZZ33OWp1YgwfiISrjZX7ZA3qjY5VhSH1QU/
 GvDjuy3whxLmZqnGsgM1V1Z1PSoh46MODSvxLo50SUtT11kjKwfvZTdCEyul9aE9PV+CZ+M0U
 XGcGNZPPMU61pb8jJw3j/eJqGO2F88Wm/tE61n7czJwtw/eVRAz1wG6AH/9ZjhkKG9Hwtqbui
 r234T75MM11XUgJ0/FjK9sZFgy6oDSwYy08gn4lkgtuIZcXWJWDxELf10s1UfuBVu0SPVWasL
 wEqNypl/Q9DTjOnFAwBb4mmi1Lj0/KS8Hh/uo0y46kYgmlnzzGI2zBg7wn07o3qs83EvSfIf4
 8D0MJI5TiiNDHvD478uGCidyA8uFKrbav8CuXjwLzyJqluKFi/hB3NfJKNf5RHIjfvghLWLer
 kESbA0UPy1TEyHr1RWh9EzPdrAoBnG2AygVyUdxY5fvLmbfQcfXoJwKV8yUMZD9iD8WgwdIAi
 B5IbAmYdMOcNa9ba/E0Kgq6Muc4Ix/DkOilMsEHsVrtYcK6lh7TY/EuBfsxCI6LLbH7qLWPkx
 hX96Z7pROvLod0O+rTxUDNiG2oaame/ndg4YyQnpysJlLgStDk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The caller passes a variable of a different enum type:

drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:1707:64: error: implicit conversion from enumeration type 'const enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Werror,-Wenum-conversion]
                                            binary_supports_input_format(xcandidate, req_in_info->format));

An earlier patch tried to address this by changing the type
of the function argument, but as the caller passes two different
arguments, there is still a warning.

Assume that the last patch was correct and change the other caller
as well.

Fixes: 0116b8df1c9e ("media: staging: atomisp: stop duplicating input format types")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 2a23b7c6aeeb..10d698295daf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1704,7 +1704,7 @@ ia_css_binary_find(struct ia_css_binary_descr *descr,
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 					    "ia_css_binary_find() [%d] continue: !%d\n",
 					    __LINE__,
-					    binary_supports_input_format(xcandidate, req_in_info->format));
+					    binary_supports_input_format(xcandidate, descr->stream_format));
 			continue;
 		}
 #endif
-- 
2.26.2

