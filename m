Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FA84DA591
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 23:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349585AbiCOWqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 18:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242472AbiCOWqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 18:46:16 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Mar 2022 15:45:03 PDT
Received: from exchange.dreamry.org (unknown [209.141.61.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258AC13E09
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 15:45:03 -0700 (PDT)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; d=dreamry.org; s=exchange; c=simple/simple;
        t=1647383392; h=from:subject:to:date:message-id;
        bh=Z8O/KRORfr7mgqLijq/FYp4eMkLVJ0Es72yd5cIiFdo=;
        b=V+NMpmg8ILIqfpwaKQuJImvKpk9Lm0CivQP7xhJ8erE+g1Bey3yWf+VnM5IIqNG/4UwEM4KQKQB
        DVcbZsUEyW42X/uAv/HjIDSVw4ETc/tRSF2BdYhhQJHJXr5JGDXXvPOD+26FC+u6d7a11yGUDaM+b
        D75kMyoHiz7oxXKZNoU/qWzS5u0dFXXdCgV6wdoyb3ivbSo0OJXgzUlX61wAOlQ/l5yjfXCfYEPJE
        B17oHldoK10iUKqohE+OPxdOzx5vWfuxBM52+MeK+RBSIyozhKau6LMhRWiUtBvtF2SnM4aHHoicZ
        tVBTyKvkkfG1Od3mJ9GodMkmKK9Q+CFnLcBA==
Received: from Exchange.dreamry.org (10.0.40.11) by Exchange.dreamry.org
 (10.0.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 15:29:51 -0700
Received: from Beryllium.dreamry.org (10.0.5.100) by Exchange.dreamry.org
 (10.0.40.11) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 15 Mar 2022 15:29:51 -0700
From:   Wencey Wang <wenceywang@dreamry.org>
To:     <linux-media@vger.kernel.org>
CC:     Wencey Wang <wenceywang@dreamry.org>
Subject: [PATCH] edid-decode: Fix Visual Studio builds. Use static crt while release compiles.
Date:   Wed, 16 Mar 2022 06:27:01 +0800
Message-ID: <20220315222700.2038-1-wenceywang@dreamry.org>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <wenceywang@dreamry.org>
References: <wenceywang@dreamry.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix Visual Studio build with project file edited and getsubopt from musl.
Uses static crt while release build to get rid of msvcrt.dll

Signed-off-by: Wencey Wang <wenceywang@dreamry.org>
---
 vs/edid-decode.vcxproj         |  9 +++++--
 vs/edid-decode.vcxproj.filters | 12 +++++++++
 vs/getopt.h                    |  3 +++
 vs/getsubopt.c                 | 46 ++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 vs/getsubopt.c

diff --git a/vs/edid-decode.vcxproj b/vs/edid-decode.vcxproj
index c9213ab..7b840ac 100644
--- a/vs/edid-decode.vcxproj
+++ b/vs/edid-decode.vcxproj
@@ -21,13 +21,13 @@
   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="Configuration">
     <ConfigurationType>Application</ConfigurationType>
     <UseDebugLibraries>true</UseDebugLibraries>
-    <PlatformToolset>v142</PlatformToolset>
+    <PlatformToolset>v143</PlatformToolset>
     <CharacterSet>Unicode</CharacterSet>
   </PropertyGroup>
   <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="Configuration">
     <ConfigurationType>Application</ConfigurationType>
     <UseDebugLibraries>false</UseDebugLibraries>
-    <PlatformToolset>v142</PlatformToolset>
+    <PlatformToolset>v143</PlatformToolset>
     <WholeProgramOptimization>true</WholeProgramOptimization>
     <CharacterSet>Unicode</CharacterSet>
   </PropertyGroup>
@@ -85,6 +85,7 @@
       <ConformanceMode>true</ConformanceMode>
       <AdditionalIncludeDirectories>$(ProjectDir);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
       <DisableSpecificWarnings>4244; 4018; 4267; 4996; 26451; 6385; 6001</DisableSpecificWarnings>
+      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
     </ClCompile>
     <Link>
       <SubSystem>Console</SubSystem>
@@ -94,6 +95,8 @@
     </Link>
   </ItemDefinitionGroup>
   <ItemGroup>
+    <ClCompile Include="..\calc-gtf-cvt.cpp" />
+    <ClCompile Include="..\calc-ovt.cpp" />
     <ClCompile Include="getopt.c" />
     <ClCompile Include="..\edid-decode.cpp" />
     <ClCompile Include="..\parse-base-block.cpp" />
@@ -102,8 +105,10 @@
     <ClCompile Include="..\parse-displayid-block.cpp" />
     <ClCompile Include="..\parse-ls-ext-block.cpp" />
     <ClCompile Include="..\parse-vtb-ext-block.cpp" />
+    <ClCompile Include="getsubopt.c" />
   </ItemGroup>
   <ItemGroup>
+    <ClInclude Include="..\oui.h" />
     <ClInclude Include="getopt.h" />
     <ClInclude Include="unistd.h" />
     <ClInclude Include="..\edid-decode.h" />
diff --git a/vs/edid-decode.vcxproj.filters b/vs/edid-decode.vcxproj.filters
index 68e8b7d..b98ab04 100644
--- a/vs/edid-decode.vcxproj.filters
+++ b/vs/edid-decode.vcxproj.filters
@@ -34,6 +34,15 @@
     <ClCompile Include="..\edid-decode.cpp">
       <Filter>edid-decode</Filter>
     </ClCompile>
+    <ClCompile Include="getsubopt.c">
+      <Filter>windows-unix</Filter>
+    </ClCompile>
+    <ClCompile Include="..\calc-gtf-cvt.cpp">
+      <Filter>edid-decode</Filter>
+    </ClCompile>
+    <ClCompile Include="..\calc-ovt.cpp">
+      <Filter>edid-decode</Filter>
+    </ClCompile>
   </ItemGroup>
   <ItemGroup>
     <ClInclude Include="..\edid-decode.h">
@@ -45,5 +54,8 @@
     <ClInclude Include="unistd.h">
       <Filter>windows-unix</Filter>
     </ClInclude>
+    <ClInclude Include="..\oui.h">
+      <Filter>edid-decode</Filter>
+    </ClInclude>
   </ItemGroup>
 </Project>
\ No newline at end of file
diff --git a/vs/getopt.h b/vs/getopt.h
index e34761d..a13c720 100644
--- a/vs/getopt.h
+++ b/vs/getopt.h
@@ -90,6 +90,9 @@ enum    		/* permitted values for its `has_arg' field...	*/
 
 extern int getopt_long( int, char * const [], const char *, const struct option *, int * );
 extern int getopt_long_only( int, char * const [], const char *, const struct option *, int * );
+
+extern int getsubopt(char** opt, char* const* keys, char** val);
+
 /*
  * Previous MinGW implementation had...
  */
diff --git a/vs/getsubopt.c b/vs/getsubopt.c
new file mode 100644
index 0000000..6aedffa
--- /dev/null
+++ b/vs/getsubopt.c
@@ -0,0 +1,46 @@
+/**
+ * Copyright © 2005-2020 Rich Felker, et al.
+ * 
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ * 
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ * 
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <stdlib.h>
+#include <string.h>
+
+int getsubopt(char** opt, char* const* keys, char** val)
+{
+	char* s = *opt;
+	int i;
+
+	*val = NULL;
+	*opt = strchr(s, ',');
+	if (*opt) *(*opt)++ = 0;
+	else *opt = s + strlen(s);
+
+	for (i = 0; keys[i]; i++) {
+		size_t l = strlen(keys[i]);
+		if (strncmp(keys[i], s, l)) continue;
+		if (s[l] == '=')
+			*val = s + l + 1;
+		else if (s[l]) continue;
+		return i;
+	}
+	return -1;
+}
-- 
2.33.0.windows.2

