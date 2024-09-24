Return-Path: <linux-media+bounces-18495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A229840F8
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9F9A1F22564
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F0F1428F3;
	Tue, 24 Sep 2024 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="V4JbkgV+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5B770E5;
	Tue, 24 Sep 2024 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167589; cv=pass; b=s4ubBLruOphlLcHmj76OUSpiW9lo7yAtinEFIi9iSgglZgDYmpFsU1Jl94D3FkdbIOVvjxBzT7WTbhfbXrfVhBDhd4EmkFsVyLeC4/nOLWaUkT5UnCi/Uev6siZnnmqwG5FU6ZEsXKXzZYZNlNM3levXO5Jg1YYdnYDI1MzmhvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167589; c=relaxed/simple;
	bh=1HjSjcqKv0hJSSvxe5fEamlNTDTu79kUYccqnNxLOPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pl9ZuYXG+1Rqq8LmqLEkIOQS5Km2oeZKz1RS9AfkCZY3sqBi8ykA8rsh5A1y08ajU9SbsJ4sh/MwSUQdZbxFElSqZfh0hNyFQu+HVz4yq5tgRWGn7TtUJfIx41U4qvII0f9PpaqvIwYRjL9NzdfGuu1cG80HMQ1s8UsHNVL2DMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=V4JbkgV+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727167574; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V1L1ATNF9Ji8ALVU30DYBWmLJeTgXlbc4UrhwYrTVPul7brseoAiWBCU7Wb/Sba94E0OygY7TRl78byx9Tp5ybz1+1zoBoCkFwxTZghUfRsPwRQY3+AWOW+gjweWTIi3zjI/oCRhxcJ0rjt44USdpUXcGBYgTG7YPD46Ib2K4fk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727167574; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TEasC6UDhwpRk0K90H+ekzb+QFfLGnDMa4SM8XUOUDA=; 
	b=Qqt5/idU6cGExBt5Bx+53wTy6pxtu/WyswxPsxrrhfSVwZevojEFRUBeVmMVWQ8pQySzr/C5OLaVqAroRVcFAK1h4j0zrsDvMek82XM+Q14tNzyLqPxfqFXHPxOJ2MdXXFQ6E0EN6r6zw8SCJvAK8CAQB519ZDf9cvb7yGB0+/s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727167574;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=TEasC6UDhwpRk0K90H+ekzb+QFfLGnDMa4SM8XUOUDA=;
	b=V4JbkgV+armVC5SZbvLtkfCiqdaD1M5aY0quaBl8W79cCred7GE5Tea35A5ZMAL3
	U9ztFdhR+cDnif6dpO79haxdLtTBfHXxCDq4AWrAMelncwBFRVGN/xwJoR2uykFJAb/
	4n25oRr0v83a2Pi4glfoAIcO3YVOY5b2gQg+O/0I=
Received: by mx.zohomail.com with SMTPS id 1727167573717959.6523432826634;
	Tue, 24 Sep 2024 01:46:13 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 24 Sep 2024 10:45:58 +0200
Subject: [PATCH RFC v2 2/3] docs: Add guides section for debugging
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-b4-media_docs_improve-v2-2-66318b2da726@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727167560; l=23626;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=1HjSjcqKv0hJSSvxe5fEamlNTDTu79kUYccqnNxLOPM=;
 b=snDhNbE2PbeOEd7PmQ4+47NBhR3KQGGMnK08CYaFm4Z9jflllR6opeIfCGCsVQyOSV+qvxaQzRav
 0ammFM8LC4OCgvNCAxgpUCcs+idCUViO69jDlUCIrXPB1NoMzvwc
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

This idea was formed after noticing that new developers experience
certain difficulty to navigate within the multitude of different
debugging options in the Kernel and while there often is good
documentation for the tools, the developer has to know first that they
exist and where to find them.
Add a general debugging section to the Kernel documentation, as an
easily locatable entry point to other documentation and as a general
guideline for the topic.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 .../driver_development_debugging_guide.rst         | 193 +++++++++++++++
 Documentation/debugging/index.rst                  |  66 +++++
 .../debugging/userspace_debugging_guide.rst        | 269 +++++++++++++++++++++
 Documentation/index.rst                            |   2 +
 4 files changed, 530 insertions(+)

diff --git a/Documentation/debugging/driver_development_debugging_guide.rst b/Documentation/debugging/driver_development_debugging_guide.rst
new file mode 100644
index 000000000000..c750f63ac1d3
--- /dev/null
+++ b/Documentation/debugging/driver_development_debugging_guide.rst
@@ -0,0 +1,193 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+========================================
+Debugging advice for driver development
+========================================
+
+This document serves as a general starting point and lookup for debugging device
+drivers.
+While this guide focuses on debugging that requires re-compiling the
+module/kernel, the `userspace-debugging-guide <userspace_debugging_guide.html>`__
+will guide you through tools like dynamic debug, ftrace and other tools useful
+for debugging issues and behavior.
+For general debugging advice, see `general-debugging-guide <index.html>`__.
+
+.. contents::
+    :depth: 3
+
+Available tools
+===============
+
+Printk & friends
+----------------
+
+These are derivatives of printf() with varying destinations and support for being dynamically turned on or off, or lack thereof.
+
+.. _printk:
+
+**Simple printk**
+~~~~~~~~~~~~~~~~~
+
+The classic, can be used to great effect for quick and dirty development
+of new modules or to extract arbitrary necessary data for troubleshooting.
+
+Prerequisite: :code:`CONFIG_PRINTK` (usually enabled by default)
+
+**Pros**:
+
+- No need to learn anything, simple to use
+- Easy to modify exactly to your needs (formatting of the data (See: `format specifiers <../core-api/printk-formats.html>`__), visibility in the log)
+- Can cause delays in the execution of the code (beneficial to confirm whether timing is a factor)
+
+**Cons**:
+
+- Requires rebuilding the kernel/module
+- Can cause delays in the execution of the code (which can cause issues to be not reproducible)
+
+`Full documentation <../core-api/printk-basics.html>`__
+
+.. _trace_printk:
+
+**Trace_printk**
+~~~~~~~~~~~~~~~~
+
+Prerequisite: :code:`CONFIG_DYNAMIC_FTRACE` & :code:`#include <linux/ftrace.h>`
+
+It is a tiny bit less comfortable to use than `printk`_, because you will have
+to read the messages from the trace file (See: `Reading the ftrace log
+<userspace_debugging_guide.html#read-the-ftrace-log>`_ instead of from the
+kernel log, but very useful when printk adds unwanted delays into the code
+execution, causing issues to be flaky or hidden.)
+
+If the processing of this still causes timing issues then you can try `trace_puts()`.
+
+`Full Documentation <../driver-api/basics.html#c.trace_printk>`__
+
+**dev_dbg**
+~~~~~~~~~~~
+
+Print statement, which can be target by `dynamic debug
+<userspace_debugging_guide.html#dynamic-debug>`__, that contains additional
+information about the device used within the context.
+
+**When is it appropriate to leave a debug print in the code?**
+
+Permanent debug statements have to be useful for a developer to troubleshoot
+driver misbehavior. Judging that is a bit more of an art than a science, but
+some guidelines are in the `Coding style guide
+<../process/coding-style.html#printing-kernel-messages>`__.
+
+**Custom printk**
+~~~~~~~~~~~~~~~~~
+
+Example:
+::
+
+  #define core_dbg(fmt, arg...) do { \
+	  if (core_debug) \
+		  printk(KERN_DEBUG pr_fmt("core: " fmt), ## arg); \
+	  } while (0)
+
+**When should you do this?**
+
+It is better to just use a `pr_debug()`, which can later be turned on/off with
+dynamic debug. Additionally, a lot of drivers activate these prints via a
+variable like `core_debug` set by a module parameter. However, Module
+parameters `are not recommended anymore
+<https://lkml.org/lkml/2024/3/27/163>`_.
+
+Ftrace
+------
+
+**Creating custom Ftrace tracepoint**
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Here is a basic description of `how to implement new tracepoints <../trace/tracepoints.html#usage>`__.
+
+`Full event tracing documentation <../trace/events.html>`__
+
+`Full Ftrace documentation <../trace/ftrace.html>`__
+
+DebugFS
+-------
+
+Prerequisite: :code:`CONFIG_DEBUG_FS` & :code:`#include <linux/debugfs.h>`
+
+DebugFS differs from the other approaches of debugging, as it doesn't write messages to the kernel log nor add traces to the code. Instead it allows the developer to handle a set of files.
+With these files you can either store values of variables or make register/memory dumps or you can make these files writable and modify values/settings in the driver.
+Possible use-cases among others:
+
+- Store register values
+- Keep track of variables
+- Store errors
+- Store settings
+- Toggle a setting like debug on/off
+- Error injection
+
+This is especially useful, when the size of a data dump would be hard to digest as
+part of the general kernel log (for example when dumping raw bitstream data) or
+when you are not interested in all the values all the time, but with the
+possibility to inspect them.
+
+The general idea is:
+
+- Create a directory during probe (`struct dentry *parent = debugfs_create_dir("my_driver", NULL);`)
+- Create a file (`debugfs_create_u32("my_value", 444, parent, &my_variable);`)
+
+  - In this example the file is found in `/sys/kernel/debug/my_driver/my_value` (with read permissions for user/group/all)
+  - any update of `my_variable` will update the value in the file
+
+- Clean up the folder when removing the device (`debugfs_remove_recursive(parent);`)
+
+`Full documentation <../filesystems/debugfs.html>`__
+
+.. _error_checking:
+
+KASAN, UBSAN, lockdep and other error checkers
+----------------------------------------------
+
+KASAN (Kernel Address Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+KASAN is a dynamic memory error detector that helps to find use-after-free and
+out-of-bounds bugs. It uses compile-time instrumentation to check every memory
+access.
+
+`Full documentation <../dev-tools/kasan.html>`__
+
+UBSAN (Undefined Behavior Sanitizer)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+UBSAN relies on compiler instrumentation and runtime checks to detect undefined
+behavior. It is designed to find a variety of issues, including signed integer overflow,
+array index out of bounds, and more.
+
+`Full documentation <../dev-tools/ubsan.html>`__
+
+lockdep (Lock Dependency Validator)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+lockdep is a runtime lock dependency validator that detects potential deadlocks
+and other locking-related issues in the kernel.
+It tracks lock acquisitions and releases, building a dependency graph that is
+analyzed for potential deadlocks.
+lockdep is especially useful for validating the correctness of lock ordering in
+the kernel.
+
+device coredump
+---------------
+
+Prerequisite: :code:`#include <linux/devcoredump.h>`
+
+Provides infrastructure through which the driver can provide arbitrary data to
+userland. It is most often used in conjunction with udev or similar userland
+infrastructure to listen for the kernel uevents, which indicates the dump is
+ready. Udev then usually has rules to copy that file somewhere for long-term
+storage and analysis as by default the data for the dump is automatically
+cleaned up after 5 minutes.
+That data is then analyzed with driver-specific tools or GDB.
+
+You can find an example implementation at: :code:`drivers/media/platform/qcom/venus/core.c`
+
+**Copyright** |copy| 2024 : Collabora
diff --git a/Documentation/debugging/index.rst b/Documentation/debugging/index.rst
new file mode 100644
index 000000000000..7bdad2fa09e1
--- /dev/null
+++ b/Documentation/debugging/index.rst
@@ -0,0 +1,66 @@
+
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+====================================================
+General debugging advice for Linux Kernel developers
+====================================================
+
+.. toctree::
+   :maxdepth: 1
+
+   driver_development_debugging_guide
+   userspace_debugging_guide
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
+
+General debugging advice
+========================
+
+Depending on the issue, a different set of tools is available to track down the
+problem or even to realize whether there is one in the first place.
+
+As a first step you have to figure out what kind of issue you want to debug.
+Depending on the answer, your methodology and choice of tools may vary.
+
+Do I need to debug with limited access?
+---------------------------------------
+
+Do you have limited access to the machine or are you unable to stop the running execution?
+
+In this case your debugging capability depends on built-in debugging support of
+provided distro kernel.
+The `userspace debugging guide <userspace_debugging_guide.html>`__ provides a
+brief overview over range of possible debugging tools in that situation. You
+can check the capability of your kernel, in most cases, by looking into config
+file within the /boot folder.
+
+Do I have root access to the system?
+------------------------------------
+
+Are you easily able to replace the module in question or to install a new kernel?
+
+In that case your range of available tools is a lot bigger, you can find the
+tools `here <driver_development_debugging_guide.html>`__.
+
+Is timing a factor?
+-------------------
+
+It is important to understand if the problem you want to debug manifests itself
+consistently (i.e. given a set of inputs you always get the same, incorrect
+output), or inconsistently. If it manifests itself inconsistently, some timing
+factor might be at play. If inserting delays into the code does change the
+behavior, then quite likely timing is a factor.
+
+When timing does alter the outcome of the code execution using a simple `printk
+<driver_development_debugging_guide.html#printk>`_ for debugging purposes won't
+work, a similar alternative is to use `trace_printk
+<driver_development_debugging_guide.html#trace-printk>`_, which logs the debug
+messages to the trace file instead of the kernel log.
+
+**Copyright** |copy| 2024 : Collabora
diff --git a/Documentation/debugging/userspace_debugging_guide.rst b/Documentation/debugging/userspace_debugging_guide.rst
new file mode 100644
index 000000000000..4d269a9ef913
--- /dev/null
+++ b/Documentation/debugging/userspace_debugging_guide.rst
@@ -0,0 +1,269 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+==========================
+Userspace debugging advice
+==========================
+
+A brief overview of common tools to debug the Linux Kernel from userspace.
+For debugging advice aimed at driver developer go `here <driver_development_debugging_guide.html>`__.
+For general debugging advice, see `general-debugging-guide <index.html>`__.
+
+.. contents::
+    :depth: 3
+
+Available tools
+===============
+
+Dynamic debug
+-------------
+
+Mechanism to filter what ends up in the kernel log by dis-/en-abling log
+messages.
+
+Prerequisite: `CONFIG_DYNAMIC_DEBUG`
+
+.. _valid_dyndbg_prints:
+
+Dynamic debug is only able to target:
+
+- `pr_debug()`
+- `dev_dbg()`
+- `print_hex_dump_debug()`
+- `print_hex_dump_bytes()`
+
+Therefore the usability of this tool is quite limited in the media subsystem,
+because, as of now, there is no uniform rule for adding debug prints to the codebase,
+resulting in a variety of ways these prints are implemented.
+
+Also, note that most debug statements are implemented as a variation of
+`dprintk`, which have to be activated via a parameter in respective module,
+dynamic debug is unable to do that step for you.
+
+Here is one example, that enables all available `pr_debug()`'s within the file:
+::
+
+  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
+  $ ddcmd '-p; file v4l2-h264.c +p'
+  $ grep =p /proc/dynamic_debug/control
+   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p "ref_pic_list_b%u (cur_poc %u%c) %s"
+   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p "ref_pic_list_p (cur_poc %u%c) %s\n"
+
+**When should you use this over** `Ftrace`_ **?**
+
+- When the code contains one of the :ref:`valid print statements <valid_dyndbg_prints_>`_ or when you have added multiple pr_debug() statements during development
+- When timing is not an issue, meaning if multiple `pr_debug()` statements in the code won't cause delays
+- When you care more about receiving specific log messages than tracing the pattern of how a function is called
+
+`Full documentation <../admin-guide/dynamic-debug-howto.html>`__
+
+Ftrace
+------
+
+Prerequisite: :code:`CONFIG_DYNAMIC_FTRACE`
+
+Trace whenever the a file is opened:
+::
+
+  $ cd /sys/kernel/tracing
+  $ echo function > /sys/kernel/tracing/current_tracer
+  $ echo do_filep_open > set_ftrace_filter
+  $ echo 1 > tracing_on
+  $ cat trace
+	find-4624    [005] ...1. 580781.888166: do_filp_open <-do_sys_openat2
+	find-4624    [005] ...1. 580781.888237: do_filp_open <-do_sys_openat2
+	find-4624    [005] ...1. 580781.888361: do_filp_open <-do_sys_openat2
+
+.. _event_tracing:
+
+Activate a ftrace event on top of that:
+::
+
+  $ echo 1 > events/kmem/kfree/enable
+	find-5351    [005] ...1. 678288.910143: do_filp_open <-do_sys_openat2
+	find-5351    [005] ..... 678288.910185: kfree: call_site=fscrypt_fname_free_buffer+0x28/0x48 ptr=0000000000000000
+	find-5351    [005] ...1. 678288.910218: do_filp_open <-do_sys_openat2
+	find-5351    [005] ..... 678288.910260: kfree: call_site=fscrypt_fname_free_buffer+0x28/0x48 ptr=0000000000000000
+	find-5351    [005] ...1. 678288.910293: do_filp_open <-do_sys_openat2
+	find-5351    [005] ..... 678288.910345: kfree: call_site=fscrypt_fname_free_buffer+0x28/0x48 ptr=0000000000000000
+	find-5351    [005] ..... 678288.910389: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=000000007ba73e40
+	find-5351    [005] ..... 678288.910390: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=000000009e4850bc
+	find-5351    [005] ..... 678288.910391: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=000000004156f20f
+	find-5351    [005] ..... 678288.910393: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=00000000c7207e20
+	find-5351    [005] ..... 678288.910394: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=0000000037c31d76
+	find-5351    [005] ..... 678288.910395: kfree: call_site=free_rb_tree_fname+0x54/0x88 ptr=0000000001922677
+
+.. _read_ftrace_log:
+
+**Reading the ftrace log**
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The `trace` file can be read just like any other file (`cat`, `tail`, `head`,
+`vim`, etc.), the size of the file is limited by the `buffer_size_kb` (``echo
+1000 > buffer_size_kb``). The `trace_pipe` will behave similar to the `trace`
+file, but whenever you read from the file the content is consumed.
+
+**Kernelshark**
+~~~~~~~~~~~~~~~
+
+A GUI interface to visualize the traces as a graph and list view from the
+output of the `trace-cmd
+<https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/>`__ application.
+
+`Kernelshark documentation <https://kernelshark.org/Documentation.html>`_
+
+`Full Ftrace documentation <../trace/ftrace.html>`__
+
+Perf & alternatives
+-------------------
+
+The tools mentioned above provide ways to inspect kernel code, results, variable values, etc.
+Sometimes you have to find out first where to look and for those cases a box of performance tracking tools can help you to frame the issue.
+
+.. _performance:
+
+**Why should you do a performance analysis?**
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A performance analysis is a good first step when among other reasons:
+
+- you cannot define the issue
+- you do not know where it occurs
+- the running system should not be interrupted or it is a remote system, where you cannot install a new module/kernel
+
+.. _linux-tools:
+
+**How to do a simple analysis with linux tools?**
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For the start of a performance analysis, you can start with the usual tools like:
+
+- `top` / `htop` / `atop` (*get an overview of the system load, see spikes on specific processes*)
+- `mpstat -P ALL` (*look at the load distribution among CPUs*)
+- `iostat -x` (*observe input and output devices utilization and performance*)
+- `vmstat` (*overview of memory usage on the system*)
+- `pidstat` (*similar to* `vmstat` *but per process, to dial it down to the target*)
+- `strace -tp $PID` (*once you know the process, you can figure out how it communicates with the Kernel*)
+
+These should help to figure out restrict the areas to look at sufficiently.
+
+**Diving deeper with perf**
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The **perf** tool provides a series of metrics and events to further dial down on issues.
+
+Prerequisite: build or install perf on your system
+
+Gather statistics data for finding all files starting with `gcc` in `/usr`
+::
+
+	# perf stat -d find /usr -name 'gcc*' | wc -l
+
+	 Performance counter stats for 'find /usr -name gcc*':
+
+		   1277.81 msec task-clock                       #    0.997 CPUs utilized             
+			 9      context-switches                 #    7.043 /sec                      
+			 1      cpu-migrations                   #    0.783 /sec                      
+		       704      page-faults                      #  550.943 /sec                      
+		 766548897      cycles                           #    0.600 GHz                         (97.15%)
+		 798285467      instructions                     #    1.04  insn per cycle              (97.15%)
+		  57582731      branches                         #   45.064 M/sec                       (2.85%)
+		   3842573      branch-misses                    #    6.67% of all branches             (97.15%)
+		 281616097      L1-dcache-loads                  #  220.390 M/sec                       (97.15%)
+		   4220975      L1-dcache-load-misses            #    1.50% of all L1-dcache accesses   (97.15%)
+	   <not supported>      LLC-loads                                                             
+	   <not supported>      LLC-load-misses                                                       
+
+	       1.281746009 seconds time elapsed
+
+	       0.508796000 seconds user
+	       0.773209000 seconds sys
+
+
+	52
+
+The availability of events and metrics depends on the system you are running.
+
+`Full documentation <https://perf.wiki.kernel.org/index.php/Main_Page>`__
+
+**Perfetto**
+~~~~~~~~~~~~
+
+A set of tools to measure and analyze how well applications and systems perform.
+You can use it to:
+
+* identify bottlenecks
+* optimize code
+* make software run faster and more efficiently.
+
+**What is the difference between perfetto and perf?**
+
+* perf is tool as part of and specialized for the Linux Kernel and has CLI user
+  interface.
+* perfetto cross-platform performance analysis stack, has extended
+  functionality into userspace and provides a WEB user interface.
+
+`Full documentation <https://perfetto.dev/docs/>`__
+
+.. _kernel_panic_analysis_tools:
+
+Kernel panic analysis tools
+---------------------------
+
+  To analyse the crash dump please use `Kdump` & `Kexec`.
+
+  `Full documentation <../admin-guide/kdump/kdump.html>`__
+
+  In order to find the corresponding line in the code you can use `faddr2line
+  <https://elixir.bootlin.com/linux/latest/source/scripts/faddr2line>`__, note
+  that you need to enable `CONFIG_DEBUG_INFO` for that to work.
+
+  An alternative to using `faddr2line` is the use of `objdump` (and it's
+  derivatives for the different platforms like `aarch64-linux-gnu-objdump`),
+  take this line as an example:
+
+  `[  +0.000240]  rkvdec_device_run+0x50/0x138 [rockchip_vdec]`.
+
+  We can find the corresponding line of code by executing:
+  ::
+
+    aarch64-linux-gnu-objdump -dS drivers/staging/media/rkvdec/rockchip-vdec.ko | grep rkvdec_device_run\>: -A 40
+    0000000000000ac8 <rkvdec_device_run>:
+     ac8:	d503201f 	nop
+     acc:	d503201f 	nop
+    {
+     ad0:	d503233f 	paciasp
+     ad4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
+     ad8:	910003fd 	mov	x29, sp
+     adc:	a90153f3 	stp	x19, x20, [sp, #16]
+     ae0:	a9025bf5 	stp	x21, x22, [sp, #32]
+        const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+     ae4:	f9411814 	ldr	x20, [x0, #560]
+        struct rkvdec_dev *rkvdec = ctx->dev;
+     ae8:	f9418015 	ldr	x21, [x0, #768]
+        if (WARN_ON(!desc))
+     aec:	b4000654 	cbz	x20, bb4 <rkvdec_device_run+0xec>
+        ret = pm_runtime_resume_and_get(rkvdec->dev);
+     af0:	f943d2b6 	ldr	x22, [x21, #1952]
+        ret = __pm_runtime_resume(dev, RPM_GET_PUT);
+     af4:	aa0003f3 	mov	x19, x0
+     af8:	52800081 	mov	w1, #0x4                   	// #4
+     afc:	aa1603e0 	mov	x0, x22
+     b00:	94000000 	bl	0 <__pm_runtime_resume>
+        if (ret < 0) {
+     b04:	37f80340 	tbnz	w0, #31, b6c <rkvdec_device_run+0xa4>
+        dev_warn(rkvdec->dev, "Not good\n");
+     b08:	f943d2a0 	ldr	x0, [x21, #1952]
+     b0c:	90000001 	adrp	x1, 0 <rkvdec_try_ctrl-0x8>
+     b10:	91000021 	add	x1, x1, #0x0
+     b14:	94000000 	bl	0 <_dev_warn>
+        *bad = 1;
+     b18:	d2800001 	mov	x1, #0x0                   	// #0
+     ...
+
+
+  To find the matching line we just have to add `0x50` (from
+  `rkvdec_device_run+0x50`) to `0xac8` (from `0000000000000ac8
+  <rkvdec_device_run>:`), which yields `0xb18` corresponding with `*bad = 1`.
+
+**Copyright** |copy| 2024 : Collabora
diff --git a/Documentation/index.rst b/Documentation/index.rst
index f9f525f4c0dd..eb8de7ba8e41 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -57,6 +57,7 @@ Various other manuals with useful information for all kernel developers.
    Testing guide <dev-tools/testing-overview>
    Hacking guide <kernel-hacking/index>
    Tracing <trace/index>
+   Debugging <debugging/index>
    Fault injection <fault-injection/index>
    Livepatching <livepatch/index>
    Rust <rust/index>
@@ -76,6 +77,7 @@ developers seeking information on the kernel's user-space APIs.
    Build system <kbuild/index>
    Reporting issues <admin-guide/reporting-issues.rst>
    Userspace tools <tools/index>
+   Userspace debugging tools <debugging/userspace_debugging_guide.rst>
    Userspace API <userspace-api/index>
 
 See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_,

-- 
2.25.1

