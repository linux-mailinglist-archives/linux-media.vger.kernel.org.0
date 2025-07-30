Return-Path: <linux-media+bounces-38672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C70CEB1682D
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 23:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE9818C733A
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 21:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F171FDA8E;
	Wed, 30 Jul 2025 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="p9Ug42dM"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E064A01
	for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753910298; cv=none; b=HpxEoOpour0WpNvp16gHl8nuST8m6UdAF+stj4+/tcPf159iKJk7OLF49vZ/BtMi5uoiSQsEYRKhgL2z/y4+kZCrve6uTrKzuspuAXW6MYjVCjZdS1//vQ7IS/51PBntYtWPancGSJ1S+DG+tJyYEoGgp3iJpF19nN2FjVV34Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753910298; c=relaxed/simple;
	bh=RN4l4z8ST9QsYyzphak3NKgqkLmWyYgN2c/U3uNAsbw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hhwZfSMzGZ+lqDFzCBUy4tdMcG73Ts1Be/bE31MIDFiL3kjjFi2OnLxD/RkcdAM8YKl8BCDkSe03rZhs5//BEQdRG7ixMUocAaja1QwwInpXA/MFn0D16kKl5No7TyJRt8AbcqikkLFedOfJKhrV+/A75qWh4gkOFpOSy95iG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=p9Ug42dM; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p1Uify5iemhC1d68SD+VzqTGmPfR8iV7v4vHaiDjTWU=; b=p9Ug42dMrMRzkWl1KIpSu9MS8t
	bM/xbcDIgw/iIcLQyxBHYnqw6lI+Ke3t4XXUD+6KdChYbhV//6mi4rPt/0kFisjWEHC2EI/9svQOg
	PJih2aVH68GIcGJo92wxVA1U+2/NnO9WIFseJw5Ip2aAFMICttlbixlV7R1l90pd0eDBpHYj/nfSd
	Q7s/EWLMPRVuQ9Yz8iGZrTUdu9ESSBKxiiiISnrbOUzDFVZ42Te/L/ec819czoDu2YGdvozKXCFSW
	WExUo3EbFCmTj0SCUP5td6V5EJDTGFPdWB+/AuXVa9DwufSrQfMk3cYglU/Mk3FLY37kXuCIpixxg
	zQPy6cmQ==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uhEBi-0007w9-0e;
	Wed, 30 Jul 2025 21:18:14 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uhEBi-004sgx-0c;
	Wed, 30 Jul 2025 21:18:14 +0000
Date: Wed, 30 Jul 2025 21:18:14 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <1679223777.2.1753910294091@builder.linuxtv.org>
In-Reply-To: <1335602510.1.1753893192925@builder.linuxtv.org>
References: <1335602510.1.1753893192925@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1447
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1447/display/redirect?page=changes>

Changes:

[Laurent Pinchart] gstreamer: Fix reconfiguration condition check

[Laurent Pinchart] gstreamer: Log and check adjusted camera configuration

[Laurent Pinchart] gstreamer: Enable bayer formats with 10/12/14/16 bits


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/libcamera/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.5'
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 096b9416b2ea8aad709c9b0f7f8f8002c0d6f9e7 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 096b9416b2ea8aad709c9b0f7f8f8002c0d6f9e7 # timeout=10
Commit message: "gstreamer: Enable bayer formats with 10/12/14/16 bits"
 > git rev-list --no-walk 56748884b649171c18efc723da4dfb97e551d1e2 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse 096b9416b2ea8aad709c9b0f7f8f8002c0d6f9e7^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/libcamera.git'
[GitCheckoutListener] Found previous build 'libcamera #1446' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since '5674888'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit '096b941' as starting point
[GitCheckoutListener] -> Recorded 3 new commits
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@7fed2a51'
[libcamera] $ /bin/sh -xe /tmp/jenkins780714632410647130.sh
+ rm -rf build
+ meson setup -Dandroid=auto -Dv4l2=true build
The Meson build system
Version: 1.0.1
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
DEPRECATION: Option 'v4l2' value 'true' is replaced by 'enabled'
Project name: libcamera
Project version: 0.5.1
C compiler for the host machine: ccache cc (gcc 12.2.0 "cc (Debian 12.2.0-14) 12.2.0")
C linker for the host machine: cc ld.bfd 2.40
C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Debian 12.2.0-14) 12.2.0")
C++ linker for the host machine: c++ ld.bfd 2.40
Host machine cpu family: x86_64
Host machine cpu: x86_64
Header "fcntl.h" has symbol "F_ADD_SEALS" : YES 
Header "unistd.h" has symbol "issetugid" : NO 
Header "locale.h" has symbol "locale_t" : YES 
Header "sys/mman.h" has symbol "memfd_create" : YES 
Header "stdlib.h" has symbol "secure_getenv" : YES 
Compiler for C supports arguments -Wno-c99-designator: NO 
Found pkg-config: /usr/bin/pkg-config (1.8.1)
Run-time dependency lttng-ust found: YES 2.13.5
Program ./parser.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/codegen/ipc/./parser.py)>
Program ./generate.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/codegen/ipc/./generate.py)>
Program ./extract-docs.py found: YES (<https://builder.linuxtv.org/job/libcamera/ws/utils/codegen/ipc/./extract-docs.py)>
Configuring version.h using configuration
Program openssl found: YES (/usr/bin/openssl)
Found CMake: /usr/bin/cmake (3.25.1)
Run-time dependency libyuv found: NO (tried pkgconfig and cmake)
Has header "libyuv.h" : NO 

Executing subproject libyuv method cmake 

libyuv| Found CMake: /usr/bin/cmake (3.25.1)

| Configuring the build directory with CMake version 3.25.1
| Running CMake with: -G Ninja -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_POSITION_INDEPENDENT_CODE=ON
| - build directory:          <https://builder.linuxtv.org/job/libcamera/ws/build/subprojects/libyuv/__CMake_build>
| - source directory:         <https://builder.linuxtv.org/job/libcamera/ws/subprojects/libyuv>
| - toolchain file:           <https://builder.linuxtv.org/job/libcamera/ws/build/subprojects/libyuv/__CMake_build/CMakeMesonToolchainFile.cmake>
| - preload file:             /usr/lib/python3/dist-packages/mesonbuild/cmake/data/preload.cmake
| - trace args:               --trace-expand --trace-format=json-v1 --no-warn-unused-cli --trace-redirect=cmake_trace.txt
| - disabled policy warnings: [CMP0025, CMP0047, CMP0056, CMP0060, CMP0065, CMP0066, CMP0067, CMP0082, CMP0089, CMP0102]

| Running with expanded trace output on.
| Not searching for unused variables given on the command line.
| Trace will be written to cmake_trace.txt
| -- The C compiler identification is GNU 12.2.0
| -- The CXX compiler identification is GNU 12.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /usr/lib/ccache/cc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /usr/lib/ccache/c++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Deprecation Warning at CMakeLists.txt:6 (CMAKE_MINIMUM_REQUIRED):
| Compatibility with CMake < 2.8.12 will be removed from a future version of
| CMake.

| Update the VERSION argument <min> value or use a ...<max> suffix to tell
| CMake that the project does not need compatibility with older versions.


| -- Found JPEG: /usr/lib/x86_64-linux-gnu/libjpeg.so (found version "62")
| CMake Warning (dev) at CMakeLists.txt:45 (if):
| Policy CMP0064 is not set: Support new TEST if() operator.  Run "cmake
| --help-policy CMP0064" for policy details.  Use the cmake_policy command to
| set the policy and suppress this warning.

| TEST will be interpreted as an operator when the policy is set to NEW.
| Since the policy is not set the OLD behavior will be used.
| This warning is for project developers.  Use -Wno-dev to suppress it.

| Building ver.: 0.0.1770
| Packaging for: amd-64
| -- Configuring done
| -- Generating done
| -- Build files have been written to: <https://builder.linuxtv.org/job/libcamera/ws/build/subprojects/libyuv/__CMake_build>

libyuv| CMake configuration: SUCCEEDED
libyuv| CMake project YUV has 3 build targets.

cmake-ast| Processing generated meson AST
cmake-ast| Build file: <https://builder.linuxtv.org/job/libcamera/ws/build/subprojects/libyuv/meson.build>

libyuv| DEPRECATION: Option 'v4l2' value 'true' is replaced by 'enabled'
libyuv| Project name: YUV
libyuv| Project version: undefined
libyuv| C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Debian 12.2.0-14) 12.2.0")
libyuv| C++ linker for the host machine: c++ ld.bfd 2.40
libyuv| Build targets in project: 23
libyuv| Subproject libyuv finished.


Library atomic found: YES
Run-time dependency threads found: YES
Run-time dependency libdw found: YES 0.188
Run-time dependency libunwind found: YES 1.6.2
Header "execinfo.h" has symbol "backtrace" : YES 
Checking for function "dlopen" : YES 
Run-time dependency libudev found: YES 252
Run-time dependency yaml-0.1 found: YES 0.2.5
Run-time dependency gnutls found: YES 3.7.9
Run-time dependency libexif found: YES 0.6.24
Run-time dependency libjpeg found: YES 2.1.5
Run-time dependency libhardware found: NO (tried pkgconfig and cmake)
Run-time dependency libevent_pthreads found: YES 2.1.12-stable
Run-time dependency libtiff-4 found: YES 4.5.0
Run-time dependency GTest found: NO (tried pkgconfig and system)
Looking for a fallback subproject for the dependency gtest

Executing subproject gtest 

gtest| DEPRECATION: Option 'v4l2' value 'true' is replaced by 'enabled'
gtest| Project name: gtest
gtest| Project version: 1.11.0
gtest| C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Debian 12.2.0-14) 12.2.0")
gtest| C++ linker for the host machine: c++ ld.bfd 2.40
gtest| Dependency threads found: YES unknown (cached)
gtest| Dependency threads found: YES unknown (cached)
gtest| Dependency threads found: YES unknown (cached)
gtest| Dependency threads found: YES unknown (cached)
gtest| Build targets in project: 50
gtest| Subproject gtest finished.

Dependency gtest from subproject subprojects/googletest-release-1.11.0 found: YES 1.11.0
Run-time dependency libdrm found: YES 2.4.114
Dependency libjpeg found: YES 2.1.5 (cached)
Run-time dependency sdl2 found: YES 2.26.5
Run-time dependency qt6 (modules: Core, Gui, OpenGL, OpenGLWidgets, Widgets) found: NO (tried pkgconfig)
Run-time dependency glib-2.0 found: YES 2.74.6
Run-time dependency gstreamer-video-1.0 found: YES 1.22.0
Run-time dependency gstreamer-allocators-1.0 found: YES 1.22.0
Run-time dependency python3 found: YES 3.11
Run-time dependency pybind11 found: NO (tried pkgconfig and cmake)
Configuring libcamerify using configuration
Program doxygen found: YES (/usr/bin/doxygen)
Program dot found: YES (/usr/bin/dot)
Configuring Doxyfile-common using configuration
Configuring Doxyfile-public.tmpl using configuration
Configuring Doxyfile-internal using configuration
Program sphinx-build found: YES (/var/lib/jenkins/.local/bin/sphinx-build)
Program python3 found: YES (/usr/bin/python3)

Documentation/meson.build:137:8: ERROR: Problem encountered: sphinxcontrib.doxylink module not found

A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
Build step 'Execute shell' marked build as failure

